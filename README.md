How to use frp_server_infrasturcture auto creation tool for aws
1. Create a cloud9 environment in AWS.
2. Clone this git to cloud9 using git clone https://github.com/parallelbgls/frp_server_infrastructure_aws.git
3. Run cdk.install.sh.
4. Test frp server admin port using elastip ip with port 7001. Default token and admin password is a123456
5. Delete Cloud9 Environment.

How to alter token, admin password and frp version
1. Create a private gist in Github
2. Copy frps.install.sh codes to your private gist
3. Change first 3 lines
4. Alter cdk.install.sh line 5 to change the default gist to your private gist
5. Run cdk.install.sh
