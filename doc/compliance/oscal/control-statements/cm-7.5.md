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
  cm-07.05_odp.01:
    guidelines:
      - prose: software programs authorized to execute on the system are defined;
    values:
      - GSA S/SO or Contractor recommended software programs authorized to execute
        on the information system as approved by the GSA CISO and AO
    alt-identifier: cm-7.5_prm_1
  cm-07.05_odp.02:
    guidelines:
      - prose: frequency at which to review and update the list of authorized software
          programs is defined;
    values:
      - annually as part of SSPP update
    alt-identifier: cm-7.5_prm_2
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: cm-07.05
---

# cm-7.5 - \[\] Authorized Software — Allow-by-exception

## Control Statement

- \[(a)\] Identify [GSA S/SO or Contractor recommended software programs authorized to execute on the information system as approved by the GSA CISO and AO];

- \[(b)\] Employ a deny-all, permit-by-exception policy to allow the execution of authorized software programs on the system; and

- \[(c)\] Review and update the list of authorized software programs [annually as part of SSPP update].

## Control Assessment Objective

- \[CM-07(05)(a)\] [GSA S/SO or Contractor recommended software programs authorized to execute on the information system as approved by the GSA CISO and AO] are identified;

- \[CM-07(05)(b)\] a deny-all, permit-by-exception policy to allow the execution of authorized software programs on the system is employed;

- \[CM-07(05)(c)\] the list of authorized software programs is reviewed and updated [annually as part of SSPP update].

## Control guidance

Authorized software programs can be limited to specific versions or from a specific source. To facilitate a comprehensive authorized software process and increase the strength of protection for attacks that bypass application level authorized software, software programs may be decomposed into and monitored at different levels of detail. These levels include applications, application programming interfaces, application modules, scripts, system processes, system services, kernel functions, registries, drivers, and dynamic link libraries. The concept of permitting the execution of authorized software may also be applied to user actions, system ports and protocols, IP addresses/ranges, websites, and MAC addresses. Organizations consider verifying the integrity of authorized software programs using digital signatures, cryptographic checksums, or hash functions. Verification of authorized software can occur either prior to execution or at system startup. The identification of authorized URLs for websites is addressed in [CA-3(5)](#ca-3.5) and [SC-7](#sc-7).

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: cm-7.5 -->

#### Implementation Status: planned

______________________________________________________________________
