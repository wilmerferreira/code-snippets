# Backstage

## Software Catalog

- Core Entities
  - API
  - Component
  - Resource
- Organizational Entities
  - Group
  - User
- Ecosystem Modeling
  - Domain
  - System
- Other
  - Location
  - Type
  - Template

### API

Main fields

- Name
- System
- Owner
- Type (grpc, etc.)
- Lifecycle
- Description
- Tags

Other details

- Relations
- Providers
- Consumers

### Component

Main fields

- Name
- System
- Owner
- Type (website, etc.)
- Lifecycle
- Description
- Tags

Other details

- Has sub components
- Dependencies
  - Depends on components
  - Depends on resources

### Group

Main fields

- Name
- Type (team, etc.)
- Description
- Tags

Other details

- Child groups
- Ownership
- Members

### Location

Main fields

- Name
- Type (team, etc.)
- Targets
- Description
- Tags

Other details

- Has sub components

### System

Main fields

- Name
- Owner
- Domain (optional)
- Description
- Tags

Other details

- Diagram
- Relations
- Has components
- APIs
- Has resources

### Template

Main fields

- Name
- Type (service, etc.)
- Description
- Tags

Other details

- Relations
- Has sub-components

### User

Main fields

- Name
- Description
- Tags

Other details

- Ownership

## Software Templates

## TechDocs

## More Information

- [Backstage by Spotify](https://backstage.spotify.com/)
  - [Learn](https://backstage.spotify.com/learn/)
- [Backstage.io](https://backstage.io/)
  - [Docs](https://backstage.io/docs/)
- [backstage/backstage - GitHub](https://github.com/backstage/backstage)
- [Backstage Demo](https://demo.backstage.io/catalog?filters%5Bkind%5D=component&filters%5Buser%5D=owned)
- [Backstage Community - YouTube](https://www.youtube.com/@BackstageCommunity)
  - [Architecture Overview](https://www.youtube.com/watch?v=cRtovI0G0Ok)
- [App Development for backstage.io on AWS](https://www.youtube.com/playlist?list=PLhr1KZpdzukemoBUAPNUMCgGk88pdURJB)
- [Backstage's Storybook Components](https://backstage.io/storybook/?path=/story/plugins-examples--plugin-with-data)
