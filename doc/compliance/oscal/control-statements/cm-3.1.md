---
x-trestle-add-props: []
  # Add or modify control properties here
  # Properties may be at the control or part level
  # Add control level properties like this:
  #   - name: ac1_new_prop
  #     value: new property value
  #
  # Add properties to a statement part like this, where "b." is the label of the target statement part
  #   - name: ac1_new_prop
  #     value: new property value
  #     smt-part: b.
  #
x-trestle-comp-def-rules:
  GitHub Actions:
    - name: properly-configured
      description: System Owner has configured the system to properly utilize CI/CD
        for all tests, scans, and deployments
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
  cm-03.01_odp.01:
    guidelines:
      - prose: mechanisms used to automate configuration change control are defined;
    values:
      - automated mechanisms as identified in the SSPP/CM Plan
    alt-identifier: cm-3.1_prm_1
  cm-03.01_odp.02:
    guidelines:
      - prose: approval authorities to be notified of and request approval for proposed
          changes to the system are defined;
    values:
      - GSA S/SO or Contractor recommended approval authorities approved by the GSA
        CISO and AO
    alt-identifier: cm-3.1_prm_2
  cm-03.01_odp.03:
    guidelines:
      - prose: the time period after which to highlight changes that have not been
          approved or disapproved is defined;
    values:
      - GSA S/SO or Contractor recommended time period approved by the GSA CISO and
        AO
    alt-identifier: cm-3.1_prm_3
  cm-03.01_odp.04:
    guidelines:
      - prose: personnel to be notified when approved changes are complete is/are
          defined;
    values:
      - Administrators (Application, System, Network, etc.), Information System Security
        Officer, Information System Security Manager, System Owner (e.g., System Program
        Manager, System Project Manager)
    alt-identifier: cm-3.1_prm_4
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: cm-03.01
---

# cm-3.1 - \[\] Automated Documentation, Notification, and Prohibition of Changes

## Control Statement

Use [automated mechanisms as identified in the SSPP/CM Plan] to:

- \[(a)\] Document proposed changes to the system;

- \[(b)\] Notify [GSA S/SO or Contractor recommended approval authorities approved by the GSA CISO and AO] of proposed changes to the system and request change approval;

- \[(c)\] Highlight proposed changes to the system that have not been approved or disapproved within [GSA S/SO or Contractor recommended time period approved by the GSA CISO and AO];

- \[(d)\] Prohibit changes to the system until designated approvals are received;

- \[(e)\] Document all changes to the system; and

- \[(f)\] Notify [Administrators (Application, System, Network, etc.), Information System Security Officer, Information System Security Manager, System Owner (e.g., System Program Manager, System Project Manager)] when approved changes to the system are completed.

## Control Assessment Objective

- \[CM-03(01)(a)\] [automated mechanisms as identified in the SSPP/CM Plan] are used to document proposed changes to the system;

- \[CM-03(01)(b)\] [automated mechanisms as identified in the SSPP/CM Plan] are used to notify [GSA S/SO or Contractor recommended approval authorities approved by the GSA CISO and AO] of proposed changes to the system and request change approval;

- \[CM-03(01)(c)\] [automated mechanisms as identified in the SSPP/CM Plan] are used to highlight proposed changes to the system that have not been approved or disapproved within [GSA S/SO or Contractor recommended time period approved by the GSA CISO and AO];

- \[CM-03(01)(d)\] [automated mechanisms as identified in the SSPP/CM Plan] are used to prohibit changes to the system until designated approvals are received;

- \[CM-03(01)(e)\] [automated mechanisms as identified in the SSPP/CM Plan] are used to document all changes to the system;

- \[CM-03(01)(f)\] [automated mechanisms as identified in the SSPP/CM Plan] are used to notify [Administrators (Application, System, Network, etc.), Information System Security Officer, Information System Security Manager, System Owner (e.g., System Program Manager, System Project Manager)] when approved changes to the system are completed.

## Control guidance

None.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: cm-3.1 -->

#### Implementation Status: planned

______________________________________________________________________

## Implementation for part (f)

### GitHub Actions

GitHub Actions is used to execute proposed changes to the information system.
Administrators and Developers for continuous_monitoring are automatically notified of
the success or failure of the change execution via the GitHub notification system.

#### Rules:

  - properly-configured

#### Implementation Status: implemented

______________________________________________________________________
