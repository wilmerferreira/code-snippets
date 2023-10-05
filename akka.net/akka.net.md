# Akka.net

Actor path:

`akka.tcp://MySystem@localhost:9001/user/actorName1`

- `akka.tcp` is the protocol
- `MySystem` is the actor system's name
- `localhost:9001` is the host address
- `/user/actorName1` is the path

IActorRefs:

- Sender
- Parent
- Children

Actor types:

- `UntypedActor`
- `TypedActor`
- `ReceiveActor`
- `ReceivePersistentActor`

Root Actors (_Guardians_)

- `/` (_the root guardian_ or _bubble-walker_)
- `/user` (_the system guardian_)
- `/system` (_the guardian_ or _root actor_)

Supervisor Strategies:

- One-For-One Strategy (default)
- All-For-One Strategy
- Custom Strategy

Dispatchers

- `SingleThreadDispatcher`: This `Dispatcher` runs multiple actors on a single thread.
- `ThreadPoolDispatcher` (default): This `Dispatcher` runs actors on top of the CLR `ThreadPool` for maximum concurrency.
- `SynchronizedDispatcher`: This `Dispatcher` schedules all actor messages to be processed in the same synchronization context as the caller. 99% of the time, this is where you're going to run actors that need access to the UI thread, such as in client applications.

PENDING

- **dead letter**
- **stash**

## Good practices

- Label actors

    ```cs
    IActorRef myFirstActor = MyActorSystem.ActorOf(Props.Create(() => new MyActorClass()), "myFirstActor");
    ```

## Reference

- [Getting Started](https://petabridge.com/blog/start/)
- [Akka Bootcamp](https://petabridge.com/bootcamp/)
  - [github:/petabridge/akka-bootcamp](https://github.com/petabridge/akka-bootcamp)
- [github:/akkadotnet/akka.net](https://github.com/akkadotnet/akka.net)
- [github:/petabridge/akkadotnet-code-samples](https://github.com/petabridge/akkadotnet-code-samples)
- [Documentation](https://getakka.net/articles/intro/what-is-akka.html)