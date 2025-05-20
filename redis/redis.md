# Redis

## Docker

This uses the [official image for redis from docker hub](https://hub.docker.com/_/redis/)

```sh
docker run --name redis -p 6379:6379 -d --restart always redis
```

## IDEs

- [Redis Insight](https://redis.io/insight/) (official app)

  ```sh
  winget install XP8K1GHCB0F1R2
  ```

- [RDM](https://docs.rdm.dev/en/2019/quick-start/) (Redis Desktop Manager)
- [P3X Redis UI](https://github.com/patrikx3/redis-ui)
- [Medis](https://getmedis.com/) (Only for Mac)
- [ARDM](https://goanother.com/) (Another Redis Desktop Manager)
- [QuickRedis](https://quick123.net/)
- [RedSmin](https://www.redsmin.com/) (Web app)
- [Redis Commander](https://github.com/joeferner/redis-commander) (Web app)
- [Redis GUI](https://github.com/ekvedaras/redis-gui)

## .NET Example

1. Install the [NRedisStack](https://www.nuget.org/packages/NRedisStack) in your project

   ```sh
   dotnet add package NRedisStack
   ```

2. Add the following _usings_

   ```cs
   using NRedisStack;
   using NRedisStack.RedisStackCommands;
   using StackExchange.Redis;
   ```

3. Connect to database

   ```cs
   // Returns object if connection has been established
   var connection = ConnectionMultiplexer.Connect("localhost"); 

   // Get first database
   var database = connection.GetDatabase();
   ```

4. Example (write and read)

   ```cs
   database.StringSet("foo", "bar");
   var value = database.StringGet("foo")
   Console.WriteLine(value); // prints bar
   ```

## More Information

- [Redis Docs](https://redis.io/docs/)
