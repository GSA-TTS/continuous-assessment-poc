---
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
  si-7_prm_1:
    aggregates:
      - si-07_odp.01
      - si-07_odp.02
      - si-07_odp.03
    profile-param-value-origin: <REPLACE_ME>
  si-7_prm_2:
    aggregates:
      - si-07_odp.04
      - si-07_odp.05
      - si-07_odp.06
    profile-param-value-origin: <REPLACE_ME>
  si-07_odp.01:
    guidelines:
      - prose: software requiring integrity verification tools to be employed to detect
          unauthorized changes is defined;
    values:
      - GSA software
  si-07_odp.02:
    guidelines:
      - prose: firmware requiring integrity verification tools to be employed to detect
          unauthorized changes is defined;
    values:
      - GSA firmware
  si-07_odp.03:
    guidelines:
      - prose: information requiring integrity verification tools to be employed to
          detect unauthorized changes is defined;
    values:
      - GSA information
  si-07_odp.04:
    guidelines:
      - prose: actions to be taken when unauthorized changes to software are detected
          are defined;
    values:
      - notify the System Owner, ISSO, ISSM, and the GSA Incident Response team
  si-07_odp.05:
    guidelines:
      - prose: actions to be taken when unauthorized changes to firmware are detected
          are defined;
    values:
      - notify the System Owner, ISSO, ISSM, and the GSA Incident Response team
  si-07_odp.06:
    guidelines:
      - prose: actions to be taken when unauthorized changes to information are detected
          are defined;
    values:
      - notify the System Owner, ISSO, ISSM, and the GSA Incident Response team
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: si-07
---

# si-7 - \[\] Software, Firmware, and Information Integrity

## Control Statement

- \[a.\] Employ integrity verification tools to detect unauthorized changes to the following software, firmware, and information: [organization-defined software, firmware, and information] ; and

- \[b.\] Take the following actions when unauthorized changes to the software, firmware, and information are detected: [organization-defined actions].

## Control Assessment Objective

- \[SI-07a.\]

  - \[SI-07a.[01]\] integrity verification tools are employed to detect unauthorized changes to [GSA software];
  - \[SI-07a.[02]\] integrity verification tools are employed to detect unauthorized changes to [GSA firmware];
  - \[SI-07a.[03]\] integrity verification tools are employed to detect unauthorized changes to [GSA information];

- \[SI-07b.\]

  - \[SI-07b.[01]\] [notify the System Owner, ISSO, ISSM, and the GSA Incident Response team] are taken when unauthorized changes to the software, are detected;
  - \[SI-07b.[02]\] [notify the System Owner, ISSO, ISSM, and the GSA Incident Response team] are taken when unauthorized changes to the firmware are detected;
  - \[SI-07b.[03]\] [notify the System Owner, ISSO, ISSM, and the GSA Incident Response team] are taken when unauthorized changes to the information are detected.

## Control guidance

Unauthorized changes to software, firmware, and information can occur due to errors or malicious activity. Software includes operating systems (with key internal components, such as kernels or drivers), middleware, and applications. Firmware interfaces include Unified Extensible Firmware Interface (UEFI) and Basic Input/Output System (BIOS). Information includes personally identifiable information and metadata that contains security and privacy attributes associated with information. Integrity-checking mechanisms—including parity checks, cyclical redundancy checks, cryptographic hashes, and associated tools—can automatically monitor the integrity of systems and hosted applications.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: si-7 -->

#### Implementation Status: planned

______________________________________________________________________
