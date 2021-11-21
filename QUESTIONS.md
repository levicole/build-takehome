# Interview Questions

Answers get more and more terse as I go because I started running out of time!

## What tenets are the most important to you when considering supply chain security in a CI/CD pipeline?
Full transparency, I had to look up what you meant by supply chainn security. With my background writing in supply chain software at Tuft and Needle, supply chain means something completely different. Thus, I don't think it's fair for me to answer this question fully, but here are some things that came to mind once I had some understanding of what it means in a CI context:

- Hosting your own packages (gems, npm packages, go libraries, etc...)
- I'm sure there's automated tooling that can scan packages for possible vulnerabilities. dependabot comes to mind, but it's more reactive.
- Building your own base docker container. So, e.g., not relying on dockerhub for images like vanilla ubuntu images, postgres images, etc...


## Describe the common patterns you have seen in adding a ruby application to a CI/CD pipeline. What operations are the most common? Why are these operations present?
- Bundling and then caching gems: Caching is particularly important because without it, each CI run would pull down the new gems over and over again. This is slow, and we want CI to be as fast as we can. Caching gems can be done as simply as storing them in a gziped file and putting them in S3.
- precompiling assets / webpack, and also caching those: Same reasons as above. Assets compilaiton can be even slower (I don't know if Stitch Fix still has legacy asset pipeline stuff, but we do).

## What are the most common ways that software is versioned? What are the benefits and challenges of each approach?
So, the only one I have familiarity with is Semantic Versioning, aka Semver. In Semantic Versioning you have 3 number separated by periods representing MAJOR.MINOR.PATCH.

The major version increments when you make breaking changes.
The minor version increments when you introduce new functionality without breaking changes (in otherwords, there is backwards compatibility).
The patch version increments when you make backwards compatible bug fixes.

Benefits: In theory, you should know what kind of changes to expect when upgrading a dependency that follows semver.
Challenges: You, as a user, have to trust that the maintainer of the packages strictly follows the approach. And as a maintainer, you have to be hyper vigilent when updating versions.


## Give some examples of configuration management tools. Which tools do you prefer and why?

I've used ansible the most, puppet second, and I used chef a very very long time ago.

I like ansible the most because, to me, it's the most simple. It ssh's in, runs it's playbooks, and then gets out. I've never had to manage thousands of servers before, and I'm sure some of the other config management tools are better at that. For the work I've done, ansible is great because it can assist in setting up a few machines quickly.

## What does the term "Infra as Code" mean? How does this term differ from "Configuration Management"?

Infra as Code: Using code to represent your infrastructure. TL;DR is it sets up your AWS/GoogleCloud resources up for you based on the code you've written. Most common tool I've used is Terraform. Terraform can also do a bit of config management...technically.
Config management: Sets up services on servers. E.g.: Ansible can set up postgres for you, and then create a database.

