---
x-trestle-comp-def-rules:
  Cloud.gov:
    - name: app-mfa-required
      description: Application owners must implement an MFA solution for all accounts
x-trestle-global:
  profile:
    title: 'Lightweight Security Authorization Process: System Security and Privacy
      Plan'
    href: trestle://profiles/lato/profile.json
  sort-id: ia-02.02
---

# ia-2.2 - \[\] Multi-factor Authentication to Non-privileged Accounts

## Control Statement

Implement multi-factor authentication for access to non-privileged accounts.

## Control Assessment Objective

multi-factor authentication for access to non-privileged accounts is implemented.

## Control guidance

Multi-factor authentication requires the use of two or more different factors to achieve authentication. The authentication factors are defined as follows: something you know (e.g., a personal identification number [PIN]), something you have (e.g., a physical authenticator such as a cryptographic private key), or something you are (e.g., a biometric). Multi-factor authentication solutions that feature physical authenticators include hardware authenticators that provide time-based or challenge-response outputs and smart cards such as the U.S. Government Personal Identity Verification card or the DoD Common Access Card. In addition to authenticating users at the system level, organizations may also employ authentication mechanisms at the application level, at their discretion, to provide increased information security. Regardless of the type of access (i.e., local, network, remote), non-privileged accounts are authenticated using multi-factor options appropriate for the level of risk. Organizations can provide additional security measures, such as additional or more rigorous authentication mechanisms, for specific types of access.

______________________________________________________________________

## What is the solution and how is it implemented?

<!-- For implementation status enter one of: implemented, partial, planned, alternative, not-applicable -->

<!-- Note that the list of rules under ### Rules: is read-only and changes will not be captured after assembly to JSON -->

### This System

<!-- Add implementation prose for the main This System component for control: ia-2.2 -->

#### Implementation Status: planned

### Cloud.gov

Application owners are responsible for implementing a MFA solution for access to their systems and resources. cloud.gov supports customers in leveraging cloud.gov's MFA-enabled authentication system to authenticate government users.

#### Rules:

  - app-mfa-required

#### Implementation Status: partial

______________________________________________________________________
