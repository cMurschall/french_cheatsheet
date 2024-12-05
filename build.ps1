# Description: This script converts all .md files in the current directory to .pdf files.
# iterate over all .md files
foreach ($mdFile in Get-ChildItem -Path . -Filter *.md) {
    # convert the .md file to a .tex file
    C:\Users\murschac\AppData\Local\Pandoc\pandoc.exe $mdFile.FullName -o $mdFile.FullName.Replace(".md", ".tex") --template=template.tex
    # convert the .tex file to a .pdf file
    pdflatex $mdFile.FullName.Replace(".md", ".tex")


}


# remove all temp .tex  output 

@("*.aux", "*.log", "*.out") | ForEach-Object {
    Get-ChildItem -Path . -Filter $_ | Remove-Item -Force
}