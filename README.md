### Built With

* [Python 3.8.8](https://python.org)
* [FastAPI 0.73.0](https://fastapi.tiangolo.com/)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites
* Linux-based system (Tested on Debian Ubuntu 20.04 only) or analogous VM
* AWS account
* Python 3.8 or higher
* pip 22.0.3
* Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
* Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installation-guide)

### Installation 
0. Clone this repository
1. Set up [AWS environmental variables](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html):
    ```sh
        export AWS_ACCESS_KEY_ID=$YOUR_AWS_ACCESS_KEY$
        export AWS_SECRET_ACCESS_KEY=$YOUR_AWS_SECRET_ACCESS_KEY$
2. Navigate to __terraform__ folder
3. Run the following command to generate ssh key-pair:
    ```sh
        ssh-keygen
4. Then save generated key as *aws_key* in the current directory
 (or edit *public_key* and *private_key* in __variables.tf__)
5. Run terraform
    ```sh
        terraform init
        terraform apply
6. Open IP-address of the server and type */time* after it. The link should look like this:
**"http://3.129.209.214/time"**

<!-- CONTACT -->
## Contact

Tagir - Telegram @NullNumber - shtagir@mail.ru

Project Link: https://github.com/tagirium/techtask
