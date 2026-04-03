import yaml
from pathlib import Path

def generate_cv_md():
    data_path = Path("ghpages/data/cv.yaml")
    output_path = Path("cv.md")
    
    with open(data_path, "r") as f:
        cv = yaml.safe_load(f)

    md = f"# **{cv['name']}**\n\n***\n\n"
    md += f">Date of Birth: {cv['date_of_birth']}\n"
    md += f"Current location: {cv['location']}\n"
    md += f"Nationality: {cv['nationality']}\n\n"
    
    # Social links
    md += f"[![LinkedIN](https://img.shields.io/badge/LinkedIN-Profile-blue.png?logo=linkedin&style=popout)]( {cv['social']['linkedin']} )\n"
    md += f"[![Github](https://img.shields.io/badge/Github-Profile-grey.png?logo=github&style=popout)]( {cv['social']['github']} )\n"
    md += f"[![Gitlab](https://img.shields.io/badge/Gitlab-Profile-orange.png?logo=gitlab&style=popout)]( {cv['social']['gitlab']} )\n\n"
    
    md += "***\n\n\\pagebreak\n\n## **Experience**\n\n***\n\n"
    
    for job in cv['experience']:
        md += f"### **[{job['company']}]({job['url']})**\n\n"
        md += f"#### **{job['position']}**\n\n"
        md += f">Dates: {job['dates']}\n"
        md += f"Location: {job['location']}\n\n"
        for detail in job['details']:
            md += f"* {detail}\n"
        md += "\n***\n\n\\pagebreak\n\n"

    # Hobbies, etc
    md += "## **Hobbies**\n\n***\n\n"
    for hobby in cv['hobbies']:
        md += f"* {hobby}\n"

    with open(output_path, "w") as f:
        f.write(md)

if __name__ == "__main__":
    generate_cv_md()
