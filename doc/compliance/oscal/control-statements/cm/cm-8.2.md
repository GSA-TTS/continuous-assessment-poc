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
  cm-8.2_prm_1:
    aggregates:
      - cm-08.02_odp.01
      - cm-08.02_odp.02
      - cm-08.02_odp.03
      - cm-08.02_odp.04
  cm-08.02_odp.01:
    guidelines:
      - prose: automated mechanisms used to maintain the currency of the system component
          inventory are defined;
    values:
      - automated mechanisms as documented in the SSPP/CM Plan
  cm-08.02_odp.02:
    guidelines:
      - prose: automated mechanisms used to maintain the completeness of the system
          component inventory are defined;
    values:
      - automated mechanisms as documented in the SSPP/CM Plan
  cm-08.02_odp.03:
    guidelines:
      - prose: automated mechanisms used to maintain the accuracy of the system component
          inventory are defined;
    values:
      - automated mechanisms as documented in the SSPP/CM Plan
  cm-08.02_odp.04:
    guidelines:
      - prose: automated mechanisms used to maintain the availability of the system
          component inventory are defined;
    values:
      - automated mechanisms as documented in the SSPP/CM Plan
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: cm-08.02
---

# cm-8.2 - \[Configuration Management\] Automated Maintenance

## Control Statement

Maintain the currency, completeness, accuracy, and availability of the inventory of system components using [automated mechanisms as documented in the SSPP/CM Plan, automated mechanisms as documented in the SSPP/CM Plan, automated mechanisms as documented in the SSPP/CM Plan, automated mechanisms as documented in the SSPP/CM Plan].

## Control Assessment Objective

- \[CM-08(02)[01]\] [automated mechanisms as documented in the SSPP/CM Plan] are used to maintain the currency of the system component inventory;

- \[CM-08(02)[02]\] [automated mechanisms as documented in the SSPP/CM Plan] are used to maintain the completeness of the system component inventory;

- \[CM-08(02)[03]\] [automated mechanisms as documented in the SSPP/CM Plan] are used to maintain the accuracy of the system component inventory;

- \[CM-08(02)[04]\] [automated mechanisms as documented in the SSPP/CM Plan] are used to maintain the availability of the system component inventory.

## Control guidance

Organizations maintain system inventories to the extent feasible. For example, virtual machines can be difficult to monitor because such machines are not visible to the network when not in use. In such cases, organizations maintain as up-to-date, complete, and accurate an inventory as is deemed reasonable. Automated maintenance can be achieved by the implementation of [CM-2(2)](#cm-2.2) for organizations that combine system component inventory and baseline configuration activities.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: cm-8.2 -->

#### Implementation Status: planned

______________________________________________________________________
