npm install -g aws-cdk
mkdir InfrastructureApp
cd InfrastructureApp
cdk init --language typescript
wget https://gist.github.com/parallelbgls/931f89fa4e464e6f88db1f978e0f7bf5/raw/frp.infrastructure.ts
mv frp.infrastructure.ts lib/infrastructure_app-stack.ts
npm run build
cdk bootstrap
cdk deploy