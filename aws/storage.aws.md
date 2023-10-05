# Storage

Types:

- Block Storage
- File Storage
- Object Storage

## Services

- [S3](https://aws.amazon.com/s3/): Object storage built to retrieve any amount of data from anywhere

  > All the buckets are private by default

  - Classes
    - Standard
    - Standard Intelligent-Tiering
    - Standard Infrequent Access (IA)
    - One Zone Infrequent Access (IA)
    - Glacier
      - Instant Retrieval
      - Flexible Retrieval: Minutes to hours
        - Expedited: 1 ~ 5 minutes
        - Standard: 3 ~ 5 hours
        - Bulk: 5 ~ 12 hours
      - Deep Archive: 12 hours or less to access

- [Elastic Block Store (EBS)](https://aws.amazon.com/ebs/): Easy to use, high performance block storage at any scale
- [Elastic File System](https://aws.amazon.com/efs/): Simple, serverless, set-and-forget, elastic file system
- [FSx](https://aws.amazon.com/fsx/): Launch, run, and scale feature-rich and highly-performant file systems with just a few clicks
  - for NetApp ONTAP
  - for OpenZFS
  - for Windows
  - for Lustre

## Migration

- Online
  - [Storage Gateway](https://aws.amazon.com/storagegateway/): Provide on-premises applications with access to virtually unlimited cloud storage
  - [DataSync](https://aws.amazon.com/datasync/): Simplify and accelerate secure data migrations
  - [Transfer Family](https://aws.amazon.com/aws-transfer-family/): Easily manage and share data with simple, secure, and scalable file transfers
- Offline
  - [Snow Family](https://aws.amazon.com/snow/)
    - Snowcone
    - Snowball
      - Storage Optimized
      - Compute Optimized
    - Snowmobile
