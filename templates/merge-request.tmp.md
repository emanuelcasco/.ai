[[LLM: This template generates comprehensive merge request descriptions following standardized format. Analyze git changes and populate all applicable sections. Never display template markup to users.]]

## 📋 Summary

{{Brief overview of the feature/fix - what it accomplishes and why it matters}}

^^LINEAR_ISSUE^^

## 📝 Related Issue

- URL: **{{ISSUE_URL}}**
  ^^END_LINEAR_ISSUE^^

^^NEW_ENDPOINTS^^

## 🚀 New Endpoints

### {{API_SECTION}} (e.g., v3/target-tracking/v2)

<<REPEAT:ENDPOINTS>>

- **`{{HTTP_METHOD}} {{ENDPOINT_PATH}}`** - {{ENDPOINT_DESCRIPTION}}
  <<END_REPEAT>>

### ✨ Key Features

<<REPEAT:FEATURES>>

- **{{FEATURE_NAME}}**: {{FEATURE_DESCRIPTION}}
  <<END_REPEAT>>
  ^^END_NEW_ENDPOINTS^^

^^DATABASE_CHANGES^^

## 🗄️ Database Changes

^^NEW_TABLES^^

### New Table: `{{TABLE_NAME}}`

- {{TABLE_PURPOSE}}
- {{KEY_RELATIONSHIPS}}
- {{INDEX_OPTIMIZATIONS}}
  ^^END_NEW_TABLES^^

^^MODIFIED_TABLES^^

### Modified Tables

<<REPEAT:TABLE_MODIFICATIONS>>

- **`{{TABLE_NAME}}`**: {{CHANGES_MADE}}
  <<END_REPEAT>>
  ^^END_MODIFIED_TABLES^^
  ^^END_DATABASE_CHANGES^^

## 🔧 Implementation Details

### Core Components

<<REPEAT:COMPONENTS>>

- **`{{COMPONENT_NAME}}`**: {{COMPONENT_RESPONSIBILITY}}
  <<END_REPEAT>>

### 🔄 Data Flow

<<REPEAT:DATA_FLOW_STEPS>>
{{STEP_NUMBER}}. {{STEP_DESCRIPTION}}
<<END_REPEAT>>

## 🧪 Testing

- {{UNIT_TESTS_DESCRIPTION}}
- {{INTEGRATION_TESTS_DESCRIPTION}}
- {{SCHEMA_VALIDATION_DETAILS}}
  ^^PERFORMANCE_CONSIDERATIONS^^
- {{PERFORMANCE_CONSIDERATIONS}}
  ^^END_PERFORMANCE_CONSIDERATIONS^^

^^BREAKING_CHANGES^^

## ⚠️ Breaking Changes

<<REPEAT:BREAKING_CHANGES>>

- {{CHANGE_DESCRIPTION}}: {{MIGRATION_PATH}}
  <<END_REPEAT>>
  ^^END_BREAKING_CHANGES^^

## ✅ Checklist

- [x] Code follows guidelines
- [x] Documentation updated
- [x] Unit tests covered
      ^^INTEGRATION_TESTS^^
- [ ] Integration tests added
      ^^END_INTEGRATION_TESTS^^
      ^^PERFORMANCE_IMPACT^^
- [ ] Performance impact assessed
      ^^END_PERFORMANCE_IMPACT^^
      ^^BREAKING_CHANGES_DOCUMENTED^^
- [ ] Breaking changes documented
      ^^END_BREAKING_CHANGES_DOCUMENTED^^

[[LLM: Replace all {{placeholders}} with actual content from git analysis. Process conditional blocks (^^CONDITION^^) only if applicable. Use git diff, file analysis, and code inspection to populate technical details accurately.]]

@{example_summary}
Implements **{{FEATURE_NAME}}** feature to enable {{FEATURE_DESCRIPTION}}.
@{/example_summary}

@{example_endpoint}
- **`GET /:companyId/{{ENDPOINT_NAME}}`** - {{ENDPOINT_DESCRIPTION}}
@{/example_endpoint}

@{example_feature}
- **{{FEATURE_NAME}}**: {{FEATURE_DESCRIPTION}}
@{/example_feature}

@{example_component}
- **`{{COMPONENT_NAME}}`**: {{COMPONENT_DESCRIPTION}}
@{/example_component}
