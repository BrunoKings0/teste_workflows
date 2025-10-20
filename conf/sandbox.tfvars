env                  = "prod"
project_code         = "stg-dlk-prod"
project_account      = "galileo"
vpc_id               = "vpcsssssssssssssss"
create_apigw_global_config = true
aws_env              = "STG-INT"
subnets_private_all  = [
  {
    id = "subnet-sssssssssssssssss"
    az = "eu-west-1a"
  },
  {
    id = "subnet-sssssssssssssssssssssss"
    az = "eu-west-1b"
  },
  {
    id = "subnet-ssssssssssssssssssss"
    az = "eu-west-1a"
  },
  {
    id = "subnet-sssssssssssssss"
    az = "eu-west-1b"
  },
  {
    id = "subnet-sssssssssssssss"
    az = "eu-west-1a"
  },
  {
    id = "subnet-0d2e905b8b0fa3b92"
    az = "eu-west-1b"
  }
]

endpoint_services = {
    s3              = "com.amazonaws.eu-west-1.s3",
    athena          = "com.amazonaws.eu-west-1.athena",
    ssm             = "com.amazonaws.eu-west-1.ssm",
    secrets_manager = "com.amazonaws.eu-west-1.secretsmanager"
  }

# Only one subnet o each AZ is allowed to create load balancers, endpoint services etc
subnets_private      = ["subnet-sssssssssssss", "subnet-sssssssssssssssssss"]
subnets_public       = ["subnet-ssssssssssssss", "subnet-sssssssssssssssssss"]
cross_account_role   = "arn:aws:iam::sssssssss:role/stg-dlk-devops"
external_kms_key_arn_permissions = "arn:aws:kms:eu-west-1:ssssssssss:key/ssssssssssssssss"

s3_kms_key_id = "arn:aws:kms:eu-west-1:xxxxxxxxxxxxxxxxxx:key/70aa0c68-0398-4f16-8fda-872b3df4c0a4"


region               = "eu-west-1"
account_id           = "xxxxxxxxxxxxxxxxxxxx"
glue_job_az          = "eu-west-1a"
glue_job_subnet      = "subnet-xxxxxxxxxxxxxxxxxxx"
identity_center_region = "eu-central-1"
chunk_size = 6

account_admin_roles = [
  "arn:aws:iam::xxxxxxxxxxxxx:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkAdmin_5ee81081711ecbd9",
  "arn:aws:iam::xxxxxxxxxxxxxx:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_AdministratorAccess_9c8eabaef4137cb8"
]

extra_lakeformation_admin_roles = [
  "arn:aws:iam::xxxxxxxxxxx:role/stg-dlk-devops",
  "arn:aws:iam::xxxxxxxxxxxxxx:role/SystemDBA",
  "arn:aws:iam::xxxxxxxxxxxx:role/SystemTechnicalOwners"
]

lakeformation_read_only_admin_roles = [
  "arn:aws:iam::xxxxxxxxxxxxx:role/stg-dlk-prod-domain-confidentiality-to-roles-role",
  "arn:aws:iam::xxxxxxxxxxxxxx:role/stg-dlk-prod-lf-tags-to-snowflake-role",
  "arn:aws:iam::xxxxxxxxxxxxxxx:role/stg-dlk-prod-aws-roles-to-snowflake-groups-role",
  "arn:aws:iam::xxxxxxxxxxxxxxx:role/stg-dlk-prod-snowflake-roles-sync-role",
  "arn:aws:iam::xxxxxxxxxxx:role/stg-dlk-prod-remove-nonvalid-grants-role",
  "arn:aws:iam::xxxxxxxxxxxxx:role/stg-dlk-prod-snowflake-associated-view-sync-role",
  "arn:aws:iam::xxxxxxxxxxxx:role/stg-dlk-prod-snowflake-associated-table-sync-role",
  "arn:aws:iam::xxxxxxxxxxxx:role/stg-dlk-prod-tag_tables-glue-job-role"
]


generic_pipeline_users = [
  "stg-dlk-prod-generic-src-axs",
  "stg-dlk-prod-generic-src-supply-chain"
]

generic_pipeline_sftp_users = [
]


code_repositories = [
  "stg-dlk-secrets"
]

glue_jdbc_connections = [
   {
    name = "stg-dlk-iregistrybiportal"
    description = "IRegistry - BI OnePortal"
    connection_properties = {
      JDBC_CONNECTION_URL = "jdbc:sqlserver://stg-rds-euw1-sqlsrv-prd.ctqusyqmqkjx.eu-west-1.rds.amazonaws.com:1433/BI_Analytics_PROD"
      SECRET_ID           = "stg/dlk/glue_connections/iregistry"
    },
    allowedRolesToFetchSecret = [
      "AWSGlueServiceRole-prod-ds-iregistry-etl-source-to-raw"
    ]
   }
]
data_source_code = ["1", "2", "3", "4", "5", "6", "7", "10", "12", "18", "20", "21"]
curated_data_source_code = ["1", "2", "3", "4", "5"]
cl5_snowflake_role_external_ids = [
  "MG41896_SFCRole=2_zHE97QHl3a7vatmNkr8UuSlxzec=",
  "MG41896_SFCRole=621_I+aRHI7BzQ3PSBPV+p9J+Qfvyv8=",
  "MG41896_SFCRole=621_wco3pWz+zfYuKdOKqOu3pS7/v+E=",
  "MG41896_SFCRole=2_ey6EOqgjeLhkg2b8G72WuoluNsk=",
  "MG41896_SFCRole=2_aE/uis8eThWl6FlT08DBK2K8Oy0=",
  "MG41896_SFCRole=2_jDMVJXUJRL/UkeyciW+PDDKY4K0=",
  "MG41896_SFCRole=2_kPHhdQ3zcxfXbdpV+kDmN7NWfOQ=",
  "MG41896_SFCRole=2_5GUlkZHlB21aH84BBVmHy0BDIes=",
  "MG41896_SFCRole=2_d9Gn+wZY7Dnv4WmwV/0mcswo4v4=",
  "MG41896_SFCRole=2_KfTIkcoYf6b13cwGl2fGhe4Xs3g=",
  "MG41896_SFCRole=2_Dl6JfAKkmkwtkS51mdlzzS6GpXQ=",
  "MG41896_SFCRole=2_oZUvqQdyyMPk9wGTTUrLB9uLung=",
  "MG41896_SFCRole=2_3lac8VLSefYrjpgCvijirl1IRiY=",
  "MG41896_SFCRole=2_ccQ2RKDVYQrNZe5QA0ndO3EK82w=",
  "MG41896_SFCRole=2_02pEtmbVulaoBAIn4Rsr6sIwjlY=",
  "MG41896_SFCRole=2_yzWjH10U3GV5DX8JMuwHC8wc4iw="
  ]
cl5_snowflake_notification_external_ids = "MG41896_SFCRole=2_RKst7D8sixAQycxEqStCYo5BdbM="
dbs_raw_generic_lambda  = ["3","5","4","7"]
dbs_other_generic_lambda = ["stg-dlk-prod-ds-23-refined-db"]

raw_sales_database_name = "stg-dlk-prod-ds3-raw-db"
raw_basic_daily_sales_table_name = "ds3_appflow_sdl3_bip_salesquery_full_1720460766_latest"

remove_old_tables_database_names = "stg-dlk-prod-ds3-raw-db,stg-dlk-prod-ds7-raw-db"
remove_old_tables_expiration_days = "120"

s3_bucket_glue_job_temp_name = "stg-dlk-prod-glue-job-temporary-files"

s3_wheels_bucket_id = "stg-dlk-prod-wheels"

s3_bucket_code_artifacts_name = "stg-dlk-prod-code-artifacts"

# Indicate here the LFTags that are going to be granted to all teams
common_roles_database_tags = [
  {
    permission = ["DESCRIBE" ]
    lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] } ]
  }
]

sharing_lf_tags_config = [{
    lf_tag = "shareWithPreprod"
    target_account = "xxxxxxxxxxxxxxx"
}]

# Indicate here the LFTags that are going to be granted to the teams that belong to specific DataHubs
datahub_database_tags = {
  "Default" = []
  "CS_OP_Supply_Chain" = []
  "CS_IT_ARC_Data" = []
  "CS_Finance" = []
  "CS_Human_Resources" = []
  "CS_Marketing" = []
  "BL_ClinicalData" = []
  "CH_Digital_Channels" = []
  "BL_Dental_Technology" = []
}

# Indicate here the LFTags that are going to be granted to the teams that belong to specific roles
role_database_tags = {
  "DataEngineer" = [ ]
  "DataAnalyst" = [ ]
  "DataScience" = [ ]
}

# Indicate here the LFTags specific for a given team
team_database_tags = {
  DlkDataEngineer = []
  DlkDataEngineerRestricted = [],
  DlkDataEngineerFinance = []
  DlkDataAnalyst = []
  DlkDataScience = []
  StgCustDlkDtEngPlatform = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_IT_ARC_Data"] } ]
    }
  ]
  StgCustDlkFinRevMgmtDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_Finance"] } ]
    }
  ],
  StgCustDlkFinRepDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_Finance"] } ]
    }
  ],
  StgCustDlkSchIntDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    }
  ],
  StgCustDlkSchFinRepDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain", "CS_OP_Supply_Chain_Costs"] } ]
    },
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_CADCAM_WEU", "BL_CADCAM_USE"] } ]
    }
  ],
  StgCustDlkMktgIntDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_Marketing"] } ]
    },
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_MK_CRM"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "personal"] } ]
    }
  ],
  StgCustDlkSchExtDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    }
  ],
  StgCustDlkClnDataDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["BL_ClinicalData"] } ]
    }
  ],
  StgCustDlkAXSEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CH_Digital_Channels"] } ]
    }
  ],
  StgCustDlkIdtCldDevBIEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["BL_Dental_Technology"] } ]
    }
  ],
  StgCustDlkCmiCustInsiDtDTAnal = [],
  StgCustDlkCmiCustInsiDtDTSci = [
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_MD_Materials"] } ]
    },
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_SA_Customers"] } ]
    }
  ],
  StgCustDlkMedentikaRepDtAnal = [
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    },
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_MD_Materials"] } ]
    }
  ],
  StgCustDlkMktgIntDtSci = [
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_Marketing"] } ]
    },
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential"] }, { lf_key = "domain", lf_values = ["CS_MK_CRM"] } ]
    }
  ],
  StgCustDlkIDTNimAnalDtEng = [
    {
        permission = ["DESCRIBE"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["BL_ClinicalData"] } ]
    }
  ]
}

# Indicate here the LFTags that are going to be granted to all teams
common_roles_table_tags = [
  {
    permission = ["DESCRIBE", "SELECT"]
    lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal"] } ]
  }
]

# Indicate here the LFTags that are going to be granted to the teams that belong to specific DataHubs
datahub_table_tags = {
  "Default" = []
  "CS_Finance" = [
      {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Sales"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "personal", "confidential"] }]
      },
      {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Finance"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
      }
  ]
  "CS_OP_Supply_Chain" = []
  "CS_IT_ARC_Data" = []
  "CS_Marketing" = [
      {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Marketing", "CS_MK_Customers_Feedback", "CS_MK_Customers_Training", "CS_MK_CRM"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
      }
  ]
  "BL_ClinicalData" = [
      {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_ClinicalData"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
      }
  ]
  "CH_Digital_Channels" = []
  "BL_Dental_Technology" = []
}

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
  StgCustDlkDtEngPlatform = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_IT_ARC_Data"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_IT_ARC_Data"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Sales"] }, { lf_key = "data_confidentialitylevel", lf_values = ["*"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_CADCAM", "BL_Orthodontics", "CS_FIN_Accounting", "CS_FIN_Procurement", "CS_FIN_Treasury", "CS_Finance", "CS_IT_ARC_Data", "CS_MD_Customers", "CS_MD_Materials", "CS_MD_Org", "CS_MD_Vendors", "CS_MK_CRM", "CS_MK_Customers_Feedback", "CS_MK_Digital_Support", "CS_OP_Inventory_Management", "CS_OP_Manufacturing_Production", "CS_OP_Quality", "CS_OP_Supply_Chain", "CS_SA_Customers", "CS_SA_Materials", "CS_Sales"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_Orthodontics", "CS_FIN_Accounting", "CS_Finance", "CS_MD_Customers", "CS_MD_Materials", "CS_MD_Vendors", "CS_MK_CRM", "CS_MK_Customers_Feedback", "CS_MK_Digital_Support", "CS_OP_Inventory_Management", "CS_OP_Manufacturing_Production", "CS_OP_Quality", "CS_OP_Supply_Chain", "CS_SA_Customers", "CS_SA_Materials", "CS_SA_Pricing", "CS_Sales"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_Orthodontics"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Finance", "CS_Operations"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_Accounting", "CS_IT_ARC_Central_Services_Tools", "CS_IT_ARC_Data", "CS_MD_Customers", "CS_MD_Materials_IA", "CS_MD_Vendors_IA", "CS_OP_Supply_Chain", "CS_OP_Supply_Chain_Costs", "CS_SA_Pricing", "CS_Sales"] }, { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] }]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Marketing"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential"] } ]
    }
  ]
  StgCustDlkFinRevMgmtDtEng = [
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_Finance"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_Accounting"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Customers"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Materials"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_Controlling"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_CO_RevenueManagement"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain_Costs"] }, { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] }]
    }
  ],
  StgCustDlkFinRepDtEng = [
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_Finance"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_Accounting"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Customers"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Materials"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_Controlling"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_FIN_CO_RevenueManagement"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain_Costs"] }, { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] }]
    }
  ],
  StgCustDlkSchIntDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain", "CS_OP_Supply_Chain_Costs", "CS_OP_Manufacturing_Production", "CS_Finance", "CS_FIN_Accounting", "CS_MD_Customers", "CS_MD_Materials", "CS_Sales", "CS_SA_Customers"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Vendors"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_Orthodontics"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Manufacturing_Production"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Inventory_Management"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
    }
  ],
  StgCustDlkSchFinRepDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain", "CS_OP_Supply_Chain_Costs", "CS_OP_Manufacturing_Production", "CS_Finance", "CS_FIN_Accounting", "CS_MD_Customers", "CS_MD_Materials", "CS_Sales", "CS_SA_Customers"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain_Costs"] }, { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Vendors"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_Orthodontics"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Manufacturing_Production"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_OP_Inventory_Management"] }, { lf_key = "data_confidentialitylevel", lf_values = ["internal", "confidential"] }]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["BL_CADCAM_WEU", "BL_CADCAM_USE"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] } ]
    }
  ],
  StgCustDlkMktgIntDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_Marketing"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_SA_Customers"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_Sales"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_SA_Materials"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MD_Vendors"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_MK_CRM"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "personal"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MK_Customers_Feedback"] }, { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] } ]
    },
    {
        permission = ["DESCRIBE", "SELECT"]
        lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "domain", lf_values = ["CS_MK_Digital_Support"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "personal", "strictly_confidential"] }]
    }
  ]
  StgCustDlkSchExtDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    }
  ],
  StgCustDlkClnDataDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["BL_ClinicalData"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["BL_ClinicalData"] } ]
    }
  ],
  StgCustDlkAXSEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["CH_Digital_Channels", "BL_CADCAM", "BL_CADCAM_USE", "BL_CADCAM_WEU"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["CH_Digital_Channels"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["BL_Implantology_SIAB_WEU"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_SA_Customers"] } ]
    }
  ],
  StgCustDlkIdtCldDevBIEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["BL_Dental_Technology"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["BL_Dental_Technology"] } ]
    }
  ],
  StgCustDlkIdtCustInsightsDtAnl = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential"] }, { lf_key = "domain", lf_values = ["CS_MK_Digital_Support"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["BL_Implantology_SIAB_WEU"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["BL_Implantology_SIAB_NAM"] } ]
    }
  ],
  StgCustDlkIdtCustInsightsDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["BL_Implantology_SIAB_WEU"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential"] }, { lf_key = "domain", lf_values = ["BL_Implantology_SIAB_NAM"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    }
  ],
  StgCustDlkCmiCustInsiDtDTAnal = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_SA_Customers"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_OP_Quality"] } ]
    }
 ],
  StgCustDlkCmiCustInsiDtDTSci = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_MD_Materials"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Marketing"] } ]
    }
  ],
  StgCustDlkMedentikaRepDtAnal = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_OP_Supply_Chain"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "strictly_confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_MD_Materials"] } ]
    }
  ],
  StgCustDlkMktgIntDtSci = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential", "personal"] }, { lf_key = "domain", lf_values = ["CS_Marketing"] } ]
    },
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["personal", "confidential"] }, { lf_key = "domain", lf_values = ["CS_MK_CRM"] } ]
    },
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales"] } ]
    },
    {
      permission = ["DESCRIBE"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_SA_Customers"] } ]
    }
  ],
  StgCustDlkMktgDigMktDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_MK_CRM"] } ]
    }
  ],
  StgCustDlkFinContDtAnl = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["curated"] }, { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] }, { lf_key = "domain", lf_values = ["CS_Sales","CS_SA_Materials"] } ]
    }
  ],
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
  lf_tag_policy = [
    { lf_key = "data_zone", lf_values = ["curated"] },
    { lf_key = "data_confidentialitylevel", lf_values = ["personal"] },
    { lf_key = "domain", lf_values = ["Uno", "Dos", "Tres"] }
  ]
},
    { 
  permission = ["DESCRIBE", "SELECT"]
  lf_tag_policy = [
    { lf_key = "data_zone", lf_values = ["curated"] },
    { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] },
    { lf_key = "domain", lf_values = ["Uno"] }
  ]
},
    { 
  permission = ["DESCRIBE", "SELECT"]
  lf_tag_policy = [
    { lf_key = "data_zone", lf_values = ["curated"] },
    { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] },
    { lf_key = "domain", lf_values = ["testee", "Uno"] }
  ]
}
  ]
  StgCustDlkIDTNimAnalDtEng = [
    {
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [ { lf_key = "data_zone", lf_values = ["raw", "refined"] }, { lf_key = "domain", lf_values = ["BL_ClinicalData"] } ]
    }
  ]
  StgCustDlkLatamDaDtEngbFinalTest = [
    { 
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [
          { lf_key = "data_zone", lf_values = ["raw","curated"] },
          { lf_key = "data_confidentialitylevel", lf_values = ["personal"] },
          { lf_key = "domain", lf_values = ["Uno", "Dos", "Tres", "Cuatro", "Cinco", "Seis"] }
      ]
    },
    { 
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [
          { lf_key = "data_zone", lf_values = ["curated"] },
          { lf_key = "data_confidentialitylevel", lf_values = ["confidential"] },
          { lf_key = "domain", lf_values = ["Dos", "Tres", "Cuatro", "Cinco"] }
      ]
    },
    { 
      permission = ["DESCRIBE", "SELECT"]
      lf_tag_policy = [
          { lf_key = "data_zone", lf_values = ["curated"] },
          { lf_key = "data_confidentialitylevel", lf_values = ["strictly_confidential"] },
          { lf_key = "domain", lf_values = ["Uno","Dos"] }
      ]
    }
  ]
}# end of the team_table_tags (please, don't remove this comment, it makes parts of the automated process)

# ARN of teams associated IAM role
teams_iam_role_arn = {
    DlkDataEngineer = "arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_DlkDataEngineer_17c388bcf0f4438c"
    DlkDataEngineerRestricted = "arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_DlkDataEngineerRestricted_3c276d51a37a697d"
    DlkDataEngineerFinance = "arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_DlkDataEngineerFinance_49066bbc7fdec213"
    DlkDataAnalyst = "arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_DlkDataAnalyst_a0b246e4561f67e8"
    DlkDataScience = "arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_DlkDataScience_bfcf0ef0a00e8e93"
    StgCustDlkDtEngPlatform="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkDtEngPlatform_a55a0a71636dd6f9"
    StgCustDlkFinContDtAnl="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinContDtAnl_fdcaac94eab9e95b"
    StgCustDlkFinIntAuditDtAnl="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinIntAuditDtAnl_96696ac3609b65b7"
    StgCustDlkFinMstrDtGovEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinMstrDtGovEng_6d639f29826fe402"
    StgCustDlkFinRepDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinRepDtEng_6534202f677f3aec"
    StgCustDlkFinRevMgmtDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinRevMgmtDtEng_0d0903cf91b72577"
    StgCustDlkIdtCommEnabDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkIdtCommEnabDtEng_6ea40f579b56ef89"
    StgCustDlkIdtCustInsightsDtAnl="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkIdtCustInsightsDtAnl_254f23a43e301655"
    StgCustDlkIdtCustInsightsDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkIdtCustInsightsDtEng_3ca1c3c203551906"
    StgCustDlkIdtCustSuppDigDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkIdtCustSuppDigDtEng_658ea0a47b55e35c"
    StgCustDlkMktgCommexDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkMktgCommexDtEng_f21d0c379a68ad1f"
    StgCustDlkMktgDigMktDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkMktgDigMktDtEng_8c348b37f00fc3e7"
    StgCustDlkMktgIntDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkMktgIntDtEng_bec15743da2d91a5"
    StgCustDlkMktgIntDtSci="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkMktgIntDtSci_e966c2102f411051"
    StgCustDlkQaPostMktAnlDtAnl="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkQaPostMktAnlDtAnl_0cafc848d7b21841"
    StgCustDlkSchFinRepDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkSchFinRepDtEng_4dc3c3af42f0deba"
    StgCustDlkSchIntDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkSchIntDtEng_ab8c3908eb65b6e5"
    StgCustDlkSchExtDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkSchExtDtEng_b6b3692b87c24c04"
    StgCustDlkClnDataDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkClnDataDtEng_31ba10d773f40fd6"
    StgCustDlkAXSEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkAXSEng_ad6e8cee769cfcb8"
    StgCustDlkMktgMosDtAnl="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkMktgMosDtAnl_da13e935a73a09b7"
    StgCustDlkIdtCldDevBIEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkIdtCldDevBIEng_28b8160282ec7edc"
    StgCustDlkCmiCustInsiDtDTAnal="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkCmiCustInsiDtDTAnal_eb3b544c7dec0cfe"
    StgCustDlkCmiCustInsiDtDTSci="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkCmiCustInsiDtDTSci_6565e4ea40eb80d5"
    StgCustDlkMedentikaRepDtAnal="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkMedentikaRepDtAnal_958dd0ce5b3b7ce6"
    StgCustDlkLatamDaDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkLatamDaDtEng_36b57a08b5d40c7e"
    StgCustDlkFinCorpPricingDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinCorpPricingDtEng_f62b3f76a9a45f0c"
    StgCustDlkFinNamdatareportingDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkFinNamDataRepDtEng_4f6c0d2d6106add4"
    StgCustDlkIDTNimAnalDtEng="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkIDTNimAnalDtEng_e7002fdeaf788f7a"
    StgCustDlkOpsEMEAImpManufDTAnl="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkOpsEMEAImpManufDTAnl_ec547432bca587af"
    StgCustDlkDtAnlAPACBusinessIntel="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkDtAnlAPACBusinessIntel_72fa47dd951e2eb1"
    StgCustDlkDtSciAPACBusinessIntel="arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkDtSciAPACBusinessIntel_d9e5d84ee88d3771"
}


appFlow_prod_allowed_roles = ["arn:aws:iam::286719176505:role/aws-reserved/sso.amazonaws.com/eu-central-1/AWSReservedSSO_StgCustDlkDtEngPlatform_a55a0a71636dd6f9"]

dlkdataengineer_datalake_policy_description = "STG DlkDataEngineer Role DataLake Services Policy"
dlkdataengineer_schedule_ingestion_policy_description = "STG DlkDataEngineer Role Scheduling and Ingestion Services Policy"
dlkdataengineer_security_monitor_policy_description = "STG DlkDataEngineer Role Security Services Policy"
dlkdataanalyst_datalake_policy_description = "STG DlkDataAnalyst Role DataLake Services Policy"
dlkdataanalyst_datapreparation_policy_description = "STG DlkDataAnalyst Role Data Preparation Services Policy"
dlkdataanalyst_security_monitor_policy_description = "STG DlkDataAnalyst Role Security Services Policy"
dlkdatascience_datalake_policy_description = "STG DlkDataScience Role DataLake Services Policy"
dlkdatascience_datapreparation_policy_description = "STG DlkDataScience Role Data Preparation Services Policy"
dlkdatascience_security_monitor_policy_description = "STG DlkDataScience Role Security Services Policy"

# Lambda processing limit
lf_tags_processing_limit = 100
