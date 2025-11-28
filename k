function logData(e) {
  const ss = SpreadsheetApp.getActiveSpreadsheet();
  const sheet = ss.getActiveSheet();

  if (sheet.getLastRow() === 0) {
    sheet.appendRow([
      "Timestamp",
      "Voltage (V)",
      "Current (A)",
      "Power (W)",
      "Energy (kWh)",
      "Frequency (Hz)",
      "PF"
    ]);
  }

  const p = e.parameter || {};

  const voltage   = parseFloat(p.voltage   || "");
  const current   = parseFloat(p.current   || "");
  const power     = parseFloat(p.power     || "");
  const energy    = parseFloat(p.energy    || "");
  const frequency = parseFloat(p.frequency || "");
  const pf        = parseFloat(p.pf        || "");

  sheet.appendRow([
    new Date(),
    voltage,
    current,
    power,
    energy,
    frequency,
    pf
  ]);

  const result = {
    status: "OK",
    lastRow: sheet.getLastRow()
  };

  return ContentService
    .createTextOutput(JSON.stringify(result))
    .setMimeType(ContentService.MimeType.JSON);
}

function doGet(e) {
  return logData(e);
}

function doPost(e) {
  return logData(e);
}
