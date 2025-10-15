import hcl2
import os

def load_tfvars(path):
    with open(path, 'r') as f:
        return hcl2.load(f)
    
def generate_block(confidential_level, domains):
    return f"""{{ 
  permission = ["DESCRIBE", "SELECT"]
  lf_tag_policy = [
    {{ lf_key = "data_zone", lf_values = ["curated"] }},
    {{ lf_key = "data_confidentialitylevel", lf_values = ["{confidential_level}"] }},
    {{ lf_key = "domain", lf_values = ["{domains}"] }}
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


def generate_patch(data, team, new_personal, new_confidencial, new_strictly):
    tags = data.get("team_table_tags", {})  
    team_list = tags.get(team)

    if team_list is None:
        block = insert_new_teams(new_personal, new_confidencial,new_strictly)
        patch = f"{team} = [\n  {block}\n]"
        return ("insert", patch)
    else:
        existing_domains = [
            tag['lf_values'][0] for item in team_list for tag in item['lf_tag_policy'] if tag['lf_key'] == 'domain'
        ]

        blocks_to_add = []
        if new_personal and new_personal not in existing_domains:
            blocks_to_add.append(generate_block("personal", new_personal))
        if new_confidencial and new_confidencial not in existing_domains:
            blocks_to_add.append(generate_block("confidential", new_confidencial))
        if new_strictly and new_strictly not in existing_domains:
            blocks_to_add.append(generate_block("strictly_confidential", new_strictly))

        if not blocks_to_add:
            return ("none", "")

        patch = ",\n    ".join(blocks_to_add)
        return ("append", patch)

if __name__ == "__main__":
    team = os.environ.get("TF_TEAM")
    new_personal = os.environ.get("TF_PERSONAL")
    new_confidencial = os.environ.get("TF_CONFIDENCIAL") 
    new_strictly = os.environ.get("TF_STRICTLY")  

    tfpath = "conf/production.tfvars"
    data = load_tfvars(tfpath)
    mode, patch = generate_patch(data, team, new_personal, new_confidencial, new_strictly)
    print(mode + "|" + patch)  
