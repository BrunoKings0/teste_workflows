import hcl2
import os
import json

def parse_env_variable(var_name):
    raw_value = os.environ.get(var_name, "[]")  
    try:
        parsed_value = json.loads(raw_value)
        if isinstance(parsed_value, list):
            return parsed_value
        else:
            return []
    except json.JSONDecodeError:
        return []

def load_tfvars(path):
    with open(path, 'r') as f:
        return hcl2.load(f)
    
def generate_block(confidential_level, domains):
    domains_str = domains_list_to_str(domains)
    return f"""  {{ 
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [
          {{ lf_key = "data_zone", lf_values = ["curated"] }},
          {{ lf_key = "data_confidentialitylevel", lf_values = ["{confidential_level}"] }},
          {{ lf_key = "domain", lf_values = {domains_str} }}
      ]
      }}"""


def insert_new_teams(new_personal, new_confidencial,new_strictly):
    grant =[]
    if new_personal:
        grant.append(generate_block("personal",new_personal))
    if new_confidencial:
        grant.append(generate_block("confidentonal",new_confidencial))
    if new_strictly:
        grant.append(generate_block("strictly_confidentonal",new_strictly))

    if not grant:
        return "" 
    
    patch = ",\n    ".join(grant)
    return patch

def find_block_for_level(team_list, level):
        for item in team_list:
            for tag in item.get('lf_tag_policy', []):
                if tag.get('lf_key') == "data_confidentialitylevel":
                    vals = tag.get('lf_values', [])
                    if vals and vals[0] == level:
                        return item
        return None

def get_domains_from_block(item):
        for tag in item.get('lf_tag_policy', []):
            if tag.get('lf_key') == "domain":
                return list(tag.get('lf_values', []))
        return []

def domains_list_to_str(domains):
        return "[" + ", ".join(f'"{d}"' for d in domains) + "]"

def generate_patch(data, team, new_personal, new_confidencial, new_strictly):
    tags = data.get("team_table_tags", {})  
    team_list = tags.get(team)

    if team_list is None:
        block = insert_new_teams(new_personal, new_confidencial,new_strictly)
        patch = f"{team} = [\n  {block}\n]"
        return ("insert", patch)
    else:
        patches = []

        for level, new_list in [("personal", new_personal),
                             ("confidential", new_confidencial),
                             ("strictly_confidential", new_strictly)]:
            if not new_list:
                continue
            block = find_block_for_level(team_list, level)
            if block is not None:
                # block already exists - mix code
                existing = get_domains_from_block(block)
                # add new domains
                merged = existing.copy()
                for dom in new_list:
                    if dom not in merged:
                        merged.append(dom)
                # generate new updated code block
                patches.append((level, merged))
            else:
                # Code cblock doesn't exists, add a new one
                patches.append((level, new_list.copy()))

        if not patches:
            return ("none", "")

        patch_parts = []
        for level, doms in patches:
            patch_parts.append(generate_block(level, doms))

        patch = ",\n  ".join(patch_parts)
        return ("append", patch)

if __name__ == "__main__":
    team = os.environ.get("TF_TEAM")
    new_personal = parse_env_variable("TF_PERSONAL")
    new_confidencial = parse_env_variable("TF_CONFIDENCIAL")
    new_strictly = parse_env_variable("TF_STRICTLY")

    tfpath = "conf/production.tfvars"
    data = load_tfvars(tfpath)
    mode, patch = generate_patch(data, team, new_personal, new_confidencial, new_strictly)
    print(mode + "|" + patch)  
