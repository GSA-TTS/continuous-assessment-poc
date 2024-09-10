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
  au-06.01_odp:
    guidelines:
      - prose: automated mechanisms used for integrating audit record review, analysis,
          and reporting processes are defined;
    values:
      - the GSA Enterprise Logging Platform for systems integrated with it; GSA S/SO
        or Contractor recommended automated mechanisms as approved by the GSA CISO
        and AO
    alt-identifier: au-6.1_prm_1
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: au-06.01
---

# au-6.1 - \[Audit and Accountability\] Automated Process Integration

## Control Statement

Integrate audit record review, analysis, and reporting processes using [the GSA Enterprise Logging Platform for systems integrated with it; GSA S/SO or Contractor recommended automated mechanisms as approved by the GSA CISO and AO].

## Control Assessment Objective

audit record review, analysis, and reporting processes are integrated using [the GSA Enterprise Logging Platform for systems integrated with it; GSA S/SO or Contractor recommended automated mechanisms as approved by the GSA CISO and AO].

## Control guidance

Organizational processes that benefit from integrated audit record review, analysis, and reporting include incident response, continuous monitoring, contingency planning, investigation and response to suspicious activities, and Inspector General audits.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: au-6.1 -->

#### Implementation Status: planned

______________________________________________________________________
