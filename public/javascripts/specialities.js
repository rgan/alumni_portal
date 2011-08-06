var specialities_json = [{ specialty: "Internal Medicine", sub : ["Endocrinology", "Neurology", "Gastroenterology", "Haematology", "Pulmonology", "Hepatology", "Cardiology", "Rheumatology and Immunology", "Geriatrics", "Nephrology"]},
    { specialty: "Pediatrics", sub  : []},
    { specialty: "General Surgery", sub  : ["Pediatric Surgery", "Thoracic and Cardiovascular Surgery"]},
    { specialty: "Obstetrics and Gynaecology", sub  : []},
    { specialty: "Orthopaedic Surgery", sub  : []},
    { specialty: "Obstetrics and Gynaecology", sub  : []},
    { specialty: "Psychiatry", sub  : []},
    { specialty: "Preventive and Social Medicine", sub  : []},
    { specialty: "Ophthalmology", sub  : []},
    { specialty: "Dermatology", sub  : []},
    { specialty: "Pathology", sub  : []},
    { specialty: "Microbiology", sub  : []},
    { specialty: "Radiodiagnostics", sub  : []},
    { specialty: "Oncology and Radiation Therapy", sub  : []},
    { specialty: "Critical Care Medicine", sub  : []},
    { specialty: "Anaesthesiology", sub  : []},
    { specialty: "Pharmacology", sub  : []},
    { specialty: "Forensic Medicine", sub  : []},
    { specialty: "Anatomy", sub  : []},
    { specialty: "Biochemistry", sub  :[]},
    { specialty: "Physiology", sub  : []}
    ];

function getSpecialties() {
    var result = [];
    specialities_json.forEach(function(item) {
        result.push(item.specialty);
    });
    return result;
}
function getSubSpecialities(specialty) {
    var result = [];
    specialities_json.forEach(function(item) {
        if (item.specialty == specialty){
            result = item.sub;
        };
    });
    return result;
}