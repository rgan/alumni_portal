var specialities_json = [{ specialty: "Internal Medicine", sub : ["Endocrinology", "Neurology", "Gastroenterology", "Haematology", "Pulmonology", "Hepatology", "Cardiology", "Rheumatology and Immunology", "Geriatrics", "Nephrology"]},
    { specialty: "Pediatrics", sub  : ["Neonatology", "Paediatric Neurology", "Paediatric Cardiology", "Paediatric Gastroenterology", "Paediatric Haematology", "Paediatric Hepatology", "Paediatric Nephrology", "Paediatric Endocrinology"]},
    { specialty: "General Surgery", sub  : ["Paediatric Surgery", "Thoracic and Cardiovascular Surgery", "Vascular Surgery", "Surgical Oncology", "Head and Neck Surgery", "Plastic and Reconstructive Surgery", "Endocrine Surgery", "Hepatobilliary Surgery", "Colorectal Surgery", "Gastro-intestinal Surgery", "Urology", "Neurosurgery"]},
    { specialty: "Obstetrics and Gynaecology", sub  : ["Reproductive Medicine"]},
    { specialty: "Orthopaedic Surgery", sub  : ["Spinal Surgery", "Physical Medicine and Rehabilitation"]},
    { specialty: "Psychiatry", sub  : []},
    { specialty: "Preventive and Social Medicine", sub  : []},
    { specialty: "Ophthalmology", sub  : []},
    { specialty: "Dermatology", sub  : []},
    { specialty: "Pathology", sub  : []},
    { specialty: "Microbiology", sub  : ["Virology", "Bacteriology", "Mycology"]},
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