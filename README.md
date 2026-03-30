# Terraform AWS EC2 Multi-AZ Cluster

## 📌 Deskripsi Project

Project ini digunakan untuk membuat infrastruktur EC2 cluster di AWS menggunakan Terraform dengan konsep **High Availability (Multi-AZ)**.

Infrastructure yang dibuat:

* 1 Master Node
* Beberapa Worker Node di Availability Zone berbeda

Project ini menggunakan pendekatan **Infrastructure as Code (IaC)** dan mengikuti praktik **arsitektur cloud yang aman (private subnet)**.

---

## 🧱 Arsitektur

* AWS EC2 (t3.small)
* Existing VPC
* Private Subnet (Multi-AZ)
* Security Group (existing)
* Key Pair untuk akses SSH

---

## ⚙️ Teknologi yang Digunakan

* Terraform
* AWS EC2
* AWS VPC
* Infrastructure as Code (IaC)

---

## 🚀 Cara Menjalankan Project

### 1. Clone Repository

```bash
git clone https://github.com/jodyys/terraform-aws-ec2-cluster.git
cd terraform-aws-ec2-cluster
```

---

### 2. Setup Variable

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit file `terraform.tfvars`:

* vpc_id
* subnet_ids
* ami
* key_name

terraform.tfvars dihidden karena alasan keamanan.
Silakan salin terraform.tfvars.example dan isi dengan nilai Anda sendiri.

---

### 3. Inisialisasi Terraform

```bash
terraform init
```

---

### 4. Cek Plan

```bash
terraform plan
```

Akan muncul jumlah resource yang akan dibuat.

---

### 5. Deploy Infrastructure

```bash
terraform apply
```

Ketik:

```bash
yes
```

---

## 📊 Hasil

* EC2 Server Master berhasil dibuat
* EC2 Server 1 & 2 tersebar di beberapa Availability Zone
* Infrastruktur memiliki basic High Availability

---

## 🔐 Keamanan

* Instance berjalan di private subnet 
* Tidak memiliki akses langsung ke internet
* Menggunakan security group yang sudah dikonfigurasi

---


## 👨‍💻 Author

Devin Jodiyudanto