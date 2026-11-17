Pendahuluan
Pada project ini, saya membangun infrastruktur cloud menggunakan Amazon Web Services (AWS) dengan pendekatan Infrastructure as Code (IaC) menggunakan Terraform.

Tujuan utama project ini adalah mempelajari bagaimana infrastruktur AWS dapat dikelola melalui konfigurasi kode, sehingga proses provisioning menjadi lebih terstruktur, konsisten, dan mudah direproduksi.

Infrastruktur yang dibangun mencakup Virtual Private Cloud (VPC), Public Subnet, Internet Gateway, Route Table, Security Group, SSH Key Pair, dan Amazon EC2 Instance.

Terraform digunakan untuk mengelola seluruh resource tersebut melalui pendekatan modular dengan memisahkan konfigurasi Networking dan Compute.

Tujuan Project
Memahami konsep Infrastructure as Code menggunakan Terraform.
Membangun jaringan AWS menggunakan Terraform.
Mengimplementasikan VPC dan Public Subnet.
Menghubungkan jaringan ke internet menggunakan Internet Gateway.
Mengimplementasikan Security Group untuk membatasi akses jaringan.
Melakukan provisioning EC2 menggunakan Terraform.
Mengelola konfigurasi menggunakan Terraform Modules.
Melakukan validasi dan deployment infrastruktur.
Memverifikasi resource AWS setelah deployment.

Arsitektur Project
![alt text](screenshoot/arsitektur.webp)

Arsitektur project menggunakan satu VPC dengan satu Public Subnet yang ditempatkan pada Availability Zone us-east-1a.

Internet Gateway digunakan sebagai jalur komunikasi antara VPC dan internet. Route Table mengarahkan trafik keluar melalui Internet Gateway.

EC2 Instance ditempatkan di dalam Public Subnet dan menggunakan Security Group untuk membatasi akses SSH.

Spesifikasi Infrastruktur
KomponenKonfigurasiCloud ProviderAWSRegionus-east-1VPC CIDR10.0.0.0/16Public Subnet10.0.1.0/24Availability Zoneus-east-1aEC2 Instancet3.microOperating SystemUbuntu 22.04Root Volume8 GiB gp3EBS EncryptionEnabled

Step 1 — Environment Preparation
Sebelum membangun infrastruktur, dilakukan pemeriksaan terhadap environment yang digunakan.

Tools yang digunakan:

Terraform
AWS CLI
Git
KodeKloud AWS Playground
AWS CLI digunakan untuk memverifikasi autentikasi dan mengakses informasi AWS.

Terraform digunakan sebagai tool utama untuk mendefinisikan dan mengelola infrastruktur.

Step 2 — Terraform Project Structure
Project menggunakan pendekatan modular agar konfigurasi lebih terorganisasi dan mudah dikembangkan.

Struktur direktori:

04-aws-terraform/
├── README.md
├── docs/
├── environments/
│   └── playground/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── versions.tf
└── modules/
    ├── networking/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── compute/
        ├── main.tf
        ├── ec2.tf
        ├── key_pair.tf
        ├── variables.tf
        └── outputs.tf
Networking module bertanggung jawab mengelola komponen jaringan AWS.

Compute module bertanggung jawab mengelola EC2, Security Group, dan SSH Key Pair.

Step 3 — Membangun AWS Networking
Networking dibangun menggunakan Terraform dengan beberapa resource utama:

aws_vpc
aws_subnet
aws_internet_gateway
aws_route_table
aws_route
aws_route_table_association
VPC menggunakan CIDR 10.0.0.0/16, sedangkan Public Subnet menggunakan CIDR 10.0.1.0/24.

Public Subnet dikonfigurasi agar instance yang diluncurkan dapat memperoleh Public IPv4 Address.

Internet Gateway dihubungkan ke VPC dan Route Table dikonfigurasi menggunakan destination 0.0.0.0/0.

Networking Verification
![alt text](screenshoot/vpc.webp)

[Masukkan screenshot Public Subnet]

![alt text](<screenshoot/publiccc sub.webp>)

Press enter or click to view image in full size

[Masukkan screenshot Internet Gateway dan Route Table]

Press enter or click to view image in full size

Press enter or click to view image in full size

Press enter or click to view image in full size

Press enter or click to view image in full size

Step 4 — Konfigurasi EC2 dan Security Group
Compute module digunakan untuk membangun EC2 Instance dan mengatur akses jaringan.

Security Group mengizinkan koneksi SSH melalui TCP port 22 dari alamat IP tertentu.

Download the Medium app
Subscribe to Pro Writer Tools to remove upgrade prompts from your unlocked stories.

Subscribe to Pro Writer Tools to remove upgrade prompts from your unlocked stories.

Konfigurasi ini membatasi akses SSH agar tidak terbuka untuk seluruh alamat internet.

EC2 menggunakan konfigurasi:

Instance Type: t3.micro
AMI: Ubuntu 22.04
Root EBS: 8 GiB gp3
EBS Encryption: Enabled
SSH Authentication: ED25519 Key Pair
Security Group Verification
Press enter or click to view image in full size

Press enter or click to view image in full size

[Masukkan screenshot Security Group]

Step 5 — Terraform Validation dan Planning
Sebelum deployment, konfigurasi diperiksa menggunakan Terraform.

Validasi dilakukan menggunakan:

terraform fmt -recursive
terraform validate
terraform plan
Terraform validate menghasilkan:

Success! The configuration is valid.
Terraform Plan menghasilkan:

Plan: 9 to add, 0 to change, 0 to destroy.
Hasil tersebut menunjukkan bahwa Terraform merencanakan pembuatan sembilan resource AWS tanpa perubahan atau penghapusan resource yang sudah ada.

[Masukkan screenshot terraform validate dan terraform plan]

Press enter or click to view image in full size

Press enter or click to view image in full size

Step 6 — Deployment Menggunakan Terraform Apply
Setelah konfigurasi dan rencana deployment diperiksa, provisioning dilakukan menggunakan:

terraform apply
Setelah meninjau rencana deployment, proses dilanjutkan dengan persetujuan melalui konfirmasi Terraform.

Deployment berhasil diselesaikan dengan hasil:

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.
Sembilan resource berhasil dibuat di AWS.

[Masukkan screenshot terraform apply]

Press enter or click to view image in full size

Press enter or click to view image in full size

Step 7 — Verifikasi AWS Infrastructure
Setelah deployment, EC2 diperiksa menggunakan AWS CLI.

Perintah yang digunakan:

aws ec2 describe-instances \
  --instance-ids i-06ae3b3bfda36d2d5 \
  --query 'Reservations[0].Instances[0].[InstanceId,State.Name,InstanceType,PublicIpAddress,PrivateIpAddress,SubnetId,VpcId]' \
  --output table
Hasil verifikasi menunjukkan:

ParameterHasilInstance IDi-06ae3b3bfda36d2d5Instance StaterunningInstance Typet3.microPublic IP98.86.170.152Private IP10.0.1.110Regionus-east-1

EC2 berhasil mencapai status running setelah proses provisioning.

Press enter or click to view image in full size

Press enter or click to view image in full size

[Masukkan screenshot AWS EC2 Console]

Step 8 — SSH Access ke EC2
Bagian ini digunakan untuk memverifikasi akses administratif ke EC2 menggunakan SSH Key Pair.

[Masukkan screenshot koneksi SSH yang berhasil setelah pengujian]

Press enter or click to view image in full size

Press enter or click to view image in full size

Step 9 — Terraform State Management
Terraform State digunakan untuk menyimpan pemetaan antara konfigurasi Terraform dan resource AWS yang dikelola.

Project ini menggunakan default Local State backend.

Remote State menggunakan AWS S3 belum diterapkan dalam implementasi ini.

Pemeriksaan resource yang dikelola Terraform dilakukan menggunakan:

terraform state list
[Masukkan screenshot terraform state list]

Press enter or click to view image in full size

Press enter or click to view image in full size

Kesimpulan
Project ini berhasil mengimplementasikan Infrastructure as Code menggunakan Terraform untuk membangun infrastruktur AWS.

Sebanyak sembilan resource berhasil dibuat, mencakup networking dan compute.

EC2 berhasil mencapai status running dan dapat diverifikasi melalui AWS CLI.

Project ini memberikan pengalaman praktik dalam membangun infrastruktur cloud, menggunakan Terraform Modules, mengelola Security Group, serta melakukan provisioning dan verifikasi resource AWS.

GitHub Repository
Source code dan konfigurasi Terraform tersedia di:

https://github.com/RichardAkbar/devops-engineering-portfolio