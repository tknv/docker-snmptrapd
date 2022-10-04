# docker-snmptrapd

Checking SNMPTrap

## Usage

```bash
git clone git@github.com:tknv/docker-snmptrapd.git
cd docker-snmptrapd
mkdir mibs

--- Add vendor mib files into `./mibs` ---

docker build -t snmptrapd-image -f Dockerfile .
docker run --rm --name snmptrapd -t -p 162-162:162-162/udp snmptrapd-image
```

## Test

### snmptrap v1

`snmptrap -v1 -c public localhost .1.3.6.1.6.3.1.1.5.2 0 0 "" "" .1.3.6.1.4.1 s "hello"`

#### snmptrap v2

`snmptrap -c public -v 2c 127.0.0.1 "" 1.3.6.1.2.1.43.18.2.0.1`

#### snmptrap v3

`snmptrap -e 0x0102030405 -v 3 -u snmptrap -a MD5 -A snmptrap -x DES -X snmptrap -l authNoPriv localhost "" 1.3.6.1.2.1.43.18.2.0.1`

### snmptrap v3 noauth

`snmptrapd.conf`

```bash
authUser log,execute,net snmptrap noauth
```

`snmptrap -e 0x0102030405 -v 3 -u snmptrap -a MD5 -A snmptrap -x DES -X snmptrap -l NoauthNoPriv localhost "" 1.3.6.1.2.1.43.18.2.0.1`

## mib files

http://www.net-snmp.org/docs/mibs/
