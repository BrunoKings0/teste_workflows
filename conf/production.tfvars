# alalalala you are so cool


# Indicate here the LFTags that are going to be granted to the teams that belong to specific roles
role_table_tags = {
  "DataEngineer" = [ ]
  "DataAnalyst" = [ ]
  "DataScience" = [ ]
}

# Indicate here the LFTags specific for a given team
team_table_tags = {
  DlkDataEngineer = []
  DlkDataEngineerRestricted = []
  DlkDataEngineerFinance = []
  DlkDataAnalyst = []
  DlkDataScience = []
  StgCustDlkMktgCommexDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_SA_Customers"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_SA_Materials"] } ]
    }
  ],
  StgCustDlkSchNexusOpsDtAnal = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    }
  ],
  StgCustDlkLatamDaDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["BL_Orthodontics"] } ]
    }
  ]
}