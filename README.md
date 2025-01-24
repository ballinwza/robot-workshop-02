# Workshop

## ทดสอบระบบการสั่งซื้อใน All Online โดยใช้ Robotframework SelenoumLibrary

- Repository URL: https://github.com/ballinwza/robot-workshop-02

## วิธีการทดสอบบน Local Environment

- Clone git repository ด้วย

  - Clone by SSH git@github.com:ballinwza/robot-workshop-02.git
  - Clone by HTTPS https://github.com/ballinwza/robot-workshop-02.git

- ติดตั้ง Makefile

  - (Window)[https://medium.com/@samsorrahman/how-to-run-a-makefile-in-windows-b4d115d7c516]
  - (Linux)[https://dev.to/skypy/linux-make-install-command-2dd6]
  - (MacOS by brew)[https://formulae.brew.sh/formula/make]

- สร้าง Python local ENV ด้วยคำสั่ง

  - make create-env-os
  - make create-win-os

- เปิดใช้งาน local ENV ด้วยคำสั่ง

  - source .venv/bin/activate

- ติดตั้ง dependencies ด้วยคำสั่ง make install

- แก้ไข all_online_variables.resource ดังนี้

  - ${USERNAME} ใช้เป็น username ข้องผู้ทำการทดสอบ
  - ${PASSWORD} ใช้เป็น password ข้องผู้ทำการทดสอบ

- ทดสอบ test case ด้วยคำสั่ง

  - make run
  - sourve .venv/bin/activate && robot -v BROWSER:headlesschrome all_online_search_success.robot

- ตรวจสอบผลการทดสอบ ด้วยคำสั่ง
  - make open-log
