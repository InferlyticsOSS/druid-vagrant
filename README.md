# druid-vagrant

Single node Druid Vagrant environment

## How to use?

### Pre-requisites

- Vagrant
- Internet
- Patience

### Setup

Vagrant promises to make setting up development environments super easy, so ideally you should be able to use this setup by cloning this repository and typing in:

    $ vagrant up

This should start up a simple single-node cluster as specified in the [Druid Quickstart](http://druid.io/docs/latest/tutorials/quickstart.html).

### Monitoring and Connecting

This environment creates a private network for Druid on IP `192.168.50.4`, which can be modified in your `Vagrantfile`. 

All services should start up on their default ports on this network.

This environment starts up Supervisor at [`http://192.168.50.4:9001`](http://192.168.50.4:9001) from where you can monitor the processes.

You can monitor the `Overlord` at [`http://192.168.50.4:8090/console.html`](http://192.168.50.4:8090/console.html)

## Troubleshooting

#### My installation seems to show me some warnings about VirtualBox guest additions!

This is because VirtualBox is on version 5+ and the box image is made for 4.x. You can solve this by following the [instructions on kvz.io](http://kvz.io/blog/2013/01/16/vagrant-tip-keep-virtualbox-guest-additions-in-sync/), which involves installing the `Vbguest` plugin:

	$ vagrant plugin install vagrant-vbguest

This will download the latest guest additions when the machine is brought up.

#### Installation went fine but I can't access Druid!

Check the logs on Supervisor to see if there are any exceptions. If you can't figure it out even after searching on Google, send an email to sriram@raremile.com. 

## Help

Please email sriram@raremile.com if you have any issues getting things to work, or feel free to raise an Issue or a PR.

## Contributing

Please feel free to raise a PR if you think you have something awesome to add!

### Credits

This project was inspired by [this one](https://github.com/boneill42/druid-vagrant).