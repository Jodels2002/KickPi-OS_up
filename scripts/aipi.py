#!/usr/bin/env python3

import subprocess
import json

MODEL = "phi3"

def run_command(cmd):
    try:
        result = subprocess.check_output(cmd, shell=True, text=True)
        return result
    except subprocess.CalledProcessError as e:
        return str(e)

def get_system_info():
    info = {}
    info["uname"] = run_command("uname -a")
    info["memory"] = run_command("free -h")
    info["disk"] = run_command("df -h")
    info["cpu"] = run_command("lscpu")
    return info

def ask_ai(prompt):
    command = f'ollama run {MODEL} "{prompt}"'
    return run_command(command)

def generate_optimization(system_info):
    prompt = f"""
Du bist ein Linux-Experte.
Analysiere dieses Raspberry Pi System und schlage Optimierungen vor.

System:
{json.dumps(system_info, indent=2)}

Gib:
1. Erklärung
2. Optimierte Bash Befehle
"""
    return ask_ai(prompt)

def generate_script(task):
    prompt = f"""
Erstelle ein sicheres Bash Script für folgende Aufgabe:
{task}

Regeln:
- keine gefährlichen Befehle (rm -rf / etc.)
- kommentiere jede Zeile
"""
    return ask_ai(prompt)

def main():
    print("=== AI Raspberry Pi Manager ===")

    while True:
        print("\n1. System analysieren")
        print("2. Script generieren")
        print("3. Beenden")

        choice = input("> ")

        if choice == "1":
            sysinfo = get_system_info()
            result = generate_optimization(sysinfo)
            print("\n--- AI Vorschläge ---\n")
            print(result)

        elif choice == "2":
            task = input("Was soll optimiert werden? > ")
            script = generate_script(task)

            print("\n--- Generiertes Script ---\n")
            print(script)

            confirm = input("\nAusführen? (yes/no) > ")
            if confirm.lower() == "yes":
                with open("temp_script.sh", "w") as f:
                    f.write(script)

                subprocess.run("chmod +x temp_script.sh", shell=True)
                subprocess.run("./temp_script.sh", shell=True)

        elif choice == "3":
            break

if __name__ == "__main__":
    main()
