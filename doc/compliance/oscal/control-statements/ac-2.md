---
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: app-account-management-needed
      description: Application accounts are the responsiblity of the application owner
x-trestle-set-params:
  # You may set values for parameters in the assembled SSP by adding
  #
  # ssp-values:
  #   - value 1
  #   - value 2
  #
  # below a section of values:
  # The values list refers to the values in the resolved profile catalog, and the ssp-values represent new values
  # to be placed in SetParameters of the SSP.
  #
  ac-02_odp.01:
    guidelines:
      - prose: prerequisites and criteria for group and role membership are defined;
    values:
      - 'GSA S/SO or Contractor recommended prerequisites and criteria (based on defined
        user role(s) matrix in GSA SSPP Template Section 9: Types of Users) as approved
        by the CISO and AO'
    alt-identifier: ac-2_prm_1
  ac-02_odp.02:
    guidelines:
      - prose: attributes (as required) for each account are defined;
    values:
      - 'the following attributes as defined in the user role(s) matrix in GSA SSPP
        Template Section 9: Types of Users) Internal or External; Privileged (P),
        Non-Privileged (NP), or No Logical Access (NLA); Sensitivity Level; Authorized
        Privileges; Functions Performed; MFA Authentication Method'
    alt-identifier: ac-2_prm_2
  ac-02_odp.03:
    guidelines:
      - prose: personnel or roles required to approve requests to create accounts
          is/are defined;
    values:
      - designated account managers as specified in AC-2.b
    alt-identifier: ac-2_prm_3
  ac-02_odp.04:
    guidelines:
      - prose: policy, procedures, prerequisites, and criteria for account creation,
          enabling, modification, disabling, and removal are defined;
    values:
      - CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07,
        Access Control, and GSA-defined procedures or conditions (as applicable)
    alt-identifier: ac-2_prm_4
  ac-02_odp.05:
    guidelines:
      - prose: personnel or roles to be notified is/are defined;
    values:
      - System Owner, System/Network Administrator, and/or ISSO
    alt-identifier: ac-2_prm_5
  ac-02_odp.06:
    guidelines:
      - prose: time period within which to notify account managers when accounts are
          no longer required is defined;
    values:
      - 14 days
    alt-identifier: ac-2_prm_6
  ac-02_odp.07:
    guidelines:
      - prose: 'time period within which to notify account managers when users are
          terminated or transferred is defined; '
    values:
      - 14 days
    alt-identifier: ac-2_prm_7
  ac-02_odp.08:
    guidelines:
      - prose: time period within which to notify account managers when system usage
          or the need to know changes for an individual is defined;
    values:
      - 14 days
    alt-identifier: ac-2_prm_8
  ac-02_odp.09:
    guidelines:
      - prose: attributes needed to authorize system access (as required) are defined;
    values:
      - 'Role privileges identified in GSA SSPP Section 9: Types of Users'
    alt-identifier: ac-2_prm_9
  ac-02_odp.10:
    guidelines:
      - prose: the frequency of account review is defined;
    values:
      - annually
    alt-identifier: ac-2_prm_10
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: ac-02
---

# ac-2 - \[\] Account Management

## Control Statement

- \[a.\] Define and document the types of accounts allowed and specifically prohibited for use within the system;

- \[b.\] Assign account managers;

- \[c.\] Require [GSA S/SO or Contractor recommended prerequisites and criteria (based on defined user role(s) matrix in GSA SSPP Template Section 9: Types of Users) as approved by the CISO and AO] for group and role membership;

- \[d.\] Specify:

  - \[1.\] Authorized users of the system;
  - \[2.\] Group and role membership; and
  - \[3.\] Access authorizations (i.e., privileges) and [the following attributes as defined in the user role(s) matrix in GSA SSPP Template Section 9: Types of Users) Internal or External; Privileged (P), Non-Privileged (NP), or No Logical Access (NLA); Sensitivity Level; Authorized Privileges; Functions Performed; MFA Authentication Method] for each account;

- \[e.\] Require approvals by [designated account managers as specified in AC-2.b] for requests to create accounts;

- \[f.\] Create, enable, modify, disable, and remove accounts in accordance with [CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07, Access Control, and GSA-defined procedures or conditions (as applicable)];

- \[g.\] Monitor the use of accounts;

- \[h.\] Notify account managers and [System Owner, System/Network Administrator, and/or ISSO] within:

  - \[1.\] [14 days] when accounts are no longer required;
  - \[2.\] [14 days] when users are terminated or transferred; and
  - \[3.\] [14 days] when system usage or need-to-know changes for an individual;

- \[i.\] Authorize access to the system based on:

  - \[1.\] A valid access authorization;
  - \[2.\] Intended system usage; and
  - \[3.\] [Role privileges identified in GSA SSPP Section 9: Types of Users];

- \[j.\] Review accounts for compliance with account management requirements [annually];

- \[k.\] Establish and implement a process for changing shared or group account authenticators (if deployed) when individuals are removed from the group; and

- \[l.\] Align account management processes with personnel termination and transfer processes.

## Control Assessment Objective

- \[AC-02a.\]

  - \[AC-02a.[01]\] account types allowed for use within the system are defined and documented;
  - \[AC-02a.[02]\] account types specifically prohibited for use within the system are defined and documented;

- \[AC-02b.\] account managers are assigned;

- \[AC-02c.\] [GSA S/SO or Contractor recommended prerequisites and criteria (based on defined user role(s) matrix in GSA SSPP Template Section 9: Types of Users) as approved by the CISO and AO] for group and role membership are required;

- \[AC-02d.\]

  - \[AC-02d.01\] authorized users of the system are specified;
  - \[AC-02d.02\] group and role membership are specified;
  - \[AC-02d.03\]

    - \[AC-02d.03[01]\] access authorizations (i.e., privileges) are specified for each account;
    - \[AC-02d.03[02]\] [the following attributes as defined in the user role(s) matrix in GSA SSPP Template Section 9: Types of Users) Internal or External; Privileged (P), Non-Privileged (NP), or No Logical Access (NLA); Sensitivity Level; Authorized Privileges; Functions Performed; MFA Authentication Method] are specified for each account;

- \[AC-02e.\] approvals are required by [designated account managers as specified in AC-2.b] for requests to create accounts;

- \[AC-02f.\]

  - \[AC-02f.[01]\] accounts are created in accordance with [CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07, Access Control, and GSA-defined procedures or conditions (as applicable)];
  - \[AC-02f.[02]\] accounts are enabled in accordance with [CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07, Access Control, and GSA-defined procedures or conditions (as applicable)];
  - \[AC-02f.[03]\] accounts are modified in accordance with [CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07, Access Control, and GSA-defined procedures or conditions (as applicable)];
  - \[AC-02f.[04]\] accounts are disabled in accordance with [CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07, Access Control, and GSA-defined procedures or conditions (as applicable)];
  - \[AC-02f.[05]\] accounts are removed in accordance with [CIO-IT Security-01-01, Identification and Authentication, CIO-IT Security-01-07, Access Control, and GSA-defined procedures or conditions (as applicable)];

- \[AC-02g.\] the use of accounts is monitored; 

- \[AC-02h.\]

  - \[AC-02h.01\] account managers and [System Owner, System/Network Administrator, and/or ISSO] are notified within [14 days] when accounts are no longer required;
  - \[AC-02h.02\] account managers and [System Owner, System/Network Administrator, and/or ISSO] are notified within [14 days] when users are terminated or transferred;
  - \[AC-02h.03\] account managers and [System Owner, System/Network Administrator, and/or ISSO] are notified within [14 days] when system usage or the need to know changes for an individual;

- \[AC-02i.\]

  - \[AC-02i.01\] access to the system is authorized based on a valid access authorization;
  - \[AC-02i.02\] access to the system is authorized based on intended system usage;
  - \[AC-02i.03\] access to the system is authorized based on [Role privileges identified in GSA SSPP Section 9: Types of Users];

- \[AC-02j.\] accounts are reviewed for compliance with account management requirements [annually];

- \[AC-02k.\]

  - \[AC-02k.[01]\] a process is established for changing shared or group account authenticators (if deployed) when individuals are removed from the group;
  - \[AC-02k.[02]\] a process is implemented for changing shared or group account authenticators (if deployed) when individuals are removed from the group;

- \[AC-02l.\]

  - \[AC-02l.[01]\] account management processes are aligned with personnel termination processes;
  - \[AC-02l.[02]\] account management processes are aligned with personnel transfer processes.

## Control guidance

Examples of system account types include individual, shared, group, system, guest, anonymous, emergency, developer, temporary, and service. Identification of authorized system users and the specification of access privileges reflect the requirements in other controls in the security plan. Users requiring administrative privileges on system accounts receive additional scrutiny by organizational personnel responsible for approving such accounts and privileged access, including system owner, mission or business owner, senior agency information security officer, or senior agency official for privacy. Types of accounts that organizations may wish to prohibit due to increased risk include shared, group, emergency, anonymous, temporary, and guest accounts.

Where access involves personally identifiable information, security programs collaborate with the senior agency official for privacy to establish the specific conditions for group and role membership; specify authorized users, group and role membership, and access authorizations for each account; and create, adjust, or remove system accounts in accordance with organizational policies. Policies can include such information as account expiration dates or other factors that trigger the disabling of accounts. Organizations may choose to define access privileges or other attributes by account, type of account, or a combination of the two. Examples of other attributes required for authorizing access include restrictions on time of day, day of week, and point of origin. In defining other system account attributes, organizations consider system-related requirements and mission/business requirements. Failure to consider these factors could affect system availability.

Temporary and emergency accounts are intended for short-term use. Organizations establish temporary accounts as part of normal account activation procedures when there is a need for short-term accounts without the demand for immediacy in account activation. Organizations establish emergency accounts in response to crisis situations and with the need for rapid account activation. Therefore, emergency account activation may bypass normal account authorization processes. Emergency and temporary accounts are not to be confused with infrequently used accounts, including local logon accounts used for special tasks or when network resources are unavailable (may also be known as accounts of last resort). Such accounts remain available and are not subject to automatic disabling or removal dates. Conditions for disabling or deactivating accounts include when shared/group, emergency, or temporary accounts are no longer required and when individuals are transferred or terminated. Changing shared/group authenticators when members leave the group is intended to ensure that former group members do not retain access to the shared or group account. Some types of system accounts may require specialized training.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: ac-2 -->

#### Implementation Status: planned

______________________________________________________________________

## Implementation for part a.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

That is, your developer login to cloud.gov where you create/edit/delete applications on the platform would count as covered, but accounts within the applications you create would not be, unless they too integrate with the UAA.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part b.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part c.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part d.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part e.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part f.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part g.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part h.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part i.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part j.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________

## Implementation for part k.

### Cloud.gov

For UAA accounts (Cloud Foundry User Account and Authentication accounts, which includes cloud.gov users who log in via agency single sign-on or the cloud.gov identity provider) used to manage applications, cloud.gov provides this control. Application accounts unless integrated with the UAA are the responsibility of the application owner.

#### Rules:

  - app-account-management-needed

#### Implementation Status: partial

______________________________________________________________________
