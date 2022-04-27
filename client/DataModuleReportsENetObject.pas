unit DataModuleReportsENetObject;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Controls, frxClass, frxDBSet, frxDCtrl, Forms, Windows, Dialogs, StdCtrls,
  frxExportODF, frxExportTXT, frxExportCSV, frxExportText, frxExportImage,
  frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML, frxExportPDF,
  JvAppStorage, JvAppIniStorage, JvComponentBase, JvFormPlacement, Math,
  InvokeRegistry, Rio, SOAPHTTPClient, SOAPHTTPTrans,
  ZAbstractConnection, ZConnection, AbUnzper, WinInet, frxChBox, ZSqlProcessor;

type
  TDMReportsENetObject = class(TDataModule)
    qryToday: TZQuery;
    qryTodaydate: TDateField;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxODSExport1: TfrxODSExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxGIFExport1: TfrxGIFExport;
    frxODTExport1: TfrxODTExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxXMLExport1: TfrxXMLExport;
    frxCSVExport1: TfrxCSVExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    qryCntTechTerms: TZQuery;
    qryTTUpdCN20110314: TZQuery;
    qryTTInsCN20110314: TZQuery;
    qryTTUpdNCN: TZQuery;
    qryTTInsNCN: TZQuery;
    qryTTUpdCN: TZQuery;
    qryTTInsCN: TZQuery;
    qryTTClearZeroCN20110314: TZQuery;
    qryTTClearZeroNCN: TZQuery;
    qryTTClearZeroCN: TZQuery;
    qryCntTechTermscnt_techterms: TFloatField;
    frxDBDsLoadS04Archive: TfrxDBDataset;
    qryLoadS04Archive: TZQuery;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField3: TWideStringField;
    StringField4: TWideStringField;
    DateField2: TDateField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    MemoField1: TWideMemoField;
    frxDBDsLoadS04Finish: TfrxDBDataset;
    qryLoadS04Finish: TZQuery;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField7: TWideStringField;
    StringField8: TWideStringField;
    DateField4: TDateField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    MemoField3: TWideMemoField;
    frxDBDsLoadS04AfterGuaging: TfrxDBDataset;
    qryLoadS04AfterGuaging: TZQuery;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    StringField9: TWideStringField;
    StringField10: TWideStringField;
    DateField5: TDateField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    MemoField4: TWideMemoField;
    qryLoadS04AfterGuagingdate_realiz: TWideMemoField;
    qryLoadS04Finishdate_realiz: TWideMemoField;
    HTTPRIOENFiderGuage: THTTPRIO;
    qryTTUpdEAP: TZQuery;
    qryTTInsEAP: TZQuery;
    qryTTClearZeroEAP: TZQuery;
    frxRTechTermsQuantPower: TfrxReport;
    frxDBDsTechTermsQuantPower: TfrxDBDataset;
    qryTechTermsQuantPower: TZQuery;
    qryTechTermsQuantPowercode_substation150: TFloatField;
    qryTechTermsQuantPowercode_line10: TFloatField;
    qryTechTermsQuantPowercode_linecable: TFloatField;
    qryTechTermsQuantPowercode_substation04: TFloatField;
    qryTechTermsQuantPowercode_line04: TFloatField;
    qryTechTermsQuantPowerid_pack: TFloatField;
    qryTechTermsQuantPowername: TWideMemoField;
    qryTechTermsQuantPowerpower: TFloatField;
    qryTechTermsQuantPowerpow_exist: TFloatField;
    qryTechTermsQuantPowerpack_status: TWideStringField;
    qryTechTermsQuantPowerid_subsystem: TIntegerField;
    qryTechTermsQuantPowerdescript_ss: TWideStringField;
    HTTPRIOENLine04: THTTPRIO;
    HTTPRIOENLineCable: THTTPRIO;
    HTTPRIOENSubstation04: THTTPRIO;
    HTTPRIOENLine10: THTTPRIO;
    HTTPRIOENSubstation150: THTTPRIO;
    HTTPRIOENLine150: THTTPRIO;
    sesEN: TZConnection;
    qryENSubstation150: TZQuery;
    qryENSubstation150code_substation150: TFloatField;
    qryENSubstation150name_substation150: TWideMemoField;
    frxDBDsENSubstation150: TfrxDBDataset;
    dsTechTermsQuantPower: TDataSource;
    qryENLine10: TZQuery;
    qryENLine10code_line10: TFloatField;
    qryENLine10name_line10: TWideMemoField;
    frxDBDsENLine10: TfrxDBDataset;
    qryDBDsENLineCable: TZQuery;
    qryDBDsENLineCablecode_linecable: TFloatField;
    qryDBDsENLineCablename_linecable: TWideMemoField;
    frxDBDsENLineCable: TfrxDBDataset;
    qryENSubstation04: TZQuery;
    qryENSubstation04code_substation04: TFloatField;
    qryENSubstation04name_substation04: TWideMemoField;
    frxDBDsENSubstation04: TfrxDBDataset;
    qryENLine04: TZQuery;
    qryENLine04code_line04: TFloatField;
    qryENLine04name_line04: TWideMemoField;
    frxDBDsENLine04: TfrxDBDataset;
    frxRLoadS04Reserv: TfrxReport;
    frxRSouthEnergySystemPRIC594: TfrxReport;
    frxDBDSSouthEnergySystemPRIC594: TfrxDBDataset;
    zqrySouthEnergySystemPRIC594: TZQuery;
    zqrySubstation150_PRIC594: TZQuery;
    frxDBDSSubstation150_PRIC594: TfrxDBDataset;
    dsSubstation150_PRIC594: TDataSource;
    fltfldSubstation150_PRIC594code_substation150: TFloatField;
    wdmfldSubstation150_PRIC594name_substation150: TWideMemoField;
    lrgntfldSouthEnergySystemPRIC594quantity: TLargeintField;
    fltfldSouthEnergySystemPRIC594power: TFloatField;
    fltfldSouthEnergySystemPRIC594connect_power: TFloatField;
    qryTechTermsQuantPowerDeployed: TZQuery;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    WideMemoField1: TWideMemoField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    WideStringField1: TWideStringField;
    IntegerField9: TIntegerField;
    WideStringField2: TWideStringField;
    frxDBDsTechTermsQuantPowerDeployed: TfrxDBDataset;
    frxRTechTermsQuantPowerDeployed: TfrxReport;
    qryTechTermsQuantPowerDeployedid_ren: TFloatField;
    qryTechTermsQuantPowerDeployedrenname: TWideStringField;
    qryTechTermsQuantPowerDeployedadres: TWideStringField;
    qryTechTermsQuantPowerDeployedaccount: TWideStringField;
    qryTechTermsQuantPowerDeployedconnectionkind: TWideMemoField;
    qryTechTermsQuantPowerDeployedpack_state_id: TWideMemoField;
    qryTechTermsQuantPowerDeployedpack_state: TWideMemoField;
    qryTechTermsQuantPowerDeployedreg_num_tu_contract: TWideStringField;
    qryTechTermsQuantPowerDeployeddate_tu_contract: TDateTimeField;
    qryTechTermsQuantPowerDeployedreg_num_cn_contract: TWideStringField;
    qryTechTermsQuantPowerDeployeddate_cn_contract: TWideMemoField;
    qryTechTermsQuantPowerDeployedreg_num_spl_contract: TWideMemoField;
    qryTechTermsQuantPowerDeployedspl_power: TFloatField;
    qryTechTermsQuantPowerDeployedreg_num_pp_contract: TWideMemoField;
    qryTechTermsQuantPowerDeployedpp_power: TFloatField;
    qryENSubstation150Deployed: TZQuery;
    FloatField29: TFloatField;
    WideMemoField2: TWideMemoField;
    frxDBDsENSubstation150Deployed: TfrxDBDataset;
    dsTechTermsQuantPowerDeployed: TDataSource;
    qryENLine10Deployed: TZQuery;
    FloatField30: TFloatField;
    WideMemoField3: TWideMemoField;
    frxDBDsENLine10Deployed: TfrxDBDataset;
    qryDBDsENLineCableDeployed: TZQuery;
    FloatField31: TFloatField;
    WideMemoField4: TWideMemoField;
    frxDBDsENLineCableDeployed: TfrxDBDataset;
    qryENSubstation04Deployed: TZQuery;
    FloatField32: TFloatField;
    WideMemoField5: TWideMemoField;
    frxDBDsENSubstation04Deployed: TfrxDBDataset;
    qryENLine04Deployed: TZQuery;
    FloatField33: TFloatField;
    WideMemoField6: TWideMemoField;
    frxDBDsENLine04Deployed: TfrxDBDataset;
    qryTechTermsQuantPowerSupply: TZQuery;
    frxDBDsTechTermsQuantPowerSupply: TfrxDBDataset;
    frxRTechTermsQuantPowerSupply: TfrxReport;
    qryENSubstation150Supply: TZQuery;
    FloatField42: TFloatField;
    WideMemoField8: TWideMemoField;
    frxDBDsENSubstation150Supply: TfrxDBDataset;
    dsTechTermsQuantPowerSupply: TDataSource;
    qryENLine10Supply: TZQuery;
    FloatField43: TFloatField;
    WideMemoField9: TWideMemoField;
    frxDBDsENLine10Supply: TfrxDBDataset;
    qryDBDsENLineCableSupply: TZQuery;
    FloatField44: TFloatField;
    WideMemoField10: TWideMemoField;
    frxDBDsENLineCableSupply: TfrxDBDataset;
    qryENSubstation04Supply: TZQuery;
    FloatField45: TFloatField;
    WideMemoField11: TWideMemoField;
    frxDBDsENSubstation04Supply: TfrxDBDataset;
    qryENLine04Supply: TZQuery;
    FloatField46: TFloatField;
    WideMemoField12: TWideMemoField;
    frxDBDsENLine04Supply: TfrxDBDataset;
    qryTechTermsQuantPowerSupplyis_new_contract: TWideMemoField;
    qryTechTermsQuantPowerSupplycode_ss150: TFloatField;
    qryTechTermsQuantPowerSupplycode_substation150: TFloatField;
    qryTechTermsQuantPowerSupplycode_line04: TFloatField;
    qryTechTermsQuantPowerSupplycode_line10: TFloatField;
    qryTechTermsQuantPowerSupplycode_linecable: TFloatField;
    qryTechTermsQuantPowerSupplycode_substation04: TFloatField;
    qryTechTermsQuantPowerSupplycode_line04_1: TFloatField;
    qryTechTermsQuantPowerSupplyid_ren: TFloatField;
    qryTechTermsQuantPowerSupplyrenname: TWideStringField;
    qryTechTermsQuantPowerSupplyid_pack: TFloatField;
    qryTechTermsQuantPowerSupplyname: TWideMemoField;
    qryTechTermsQuantPowerSupplyadres: TWideStringField;
    qryTechTermsQuantPowerSupplyadres_jur: TWideStringField;
    qryTechTermsQuantPowerSupplyaccount: TWideStringField;
    qryTechTermsQuantPowerSupplyconnectionkind: TWideMemoField;
    qryTechTermsQuantPowerSupplypower: TFloatField;
    qryTechTermsQuantPowerSupplypow_exist: TFloatField;
    qryTechTermsQuantPowerSupplypack_status: TWideStringField;
    qryTechTermsQuantPowerSupplypack_state_id: TWideMemoField;
    qryTechTermsQuantPowerSupplypack_state: TWideMemoField;
    qryTechTermsQuantPowerSupplyreg_num_tu_contract: TWideMemoField;
    qryTechTermsQuantPowerSupplydate_tu_contract: TWideMemoField;
    qryTechTermsQuantPowerSupplyreg_num_cn_contract: TWideMemoField;
    qryTechTermsQuantPowerSupplydate_cn_contract: TWideMemoField;
    qryTechTermsQuantPowerSupplyreg_num_spl_contract: TWideStringField;
    qryTechTermsQuantPowerSupplydate_spl_contract: TDateTimeField;
    qryTechTermsQuantPowerSupplyspl_power: TFloatField;
    qryTechTermsQuantPowerSupplyreg_num_pp_contract: TWideStringField;
    qryTechTermsQuantPowerSupplydate_pp_contract: TDateTimeField;
    qryTechTermsQuantPowerSupplypp_power: TFloatField;
    qryTechTermsQuantPowerSupplyid_subsystem: TIntegerField;
    qryTechTermsQuantPowerSupplyid_subsystem_cn: TWideMemoField;
    qryTechTermsQuantPowerSupplydescript_ss_cn: TWideMemoField;
    frxDBDsENTransformer: TfrxDBDataset;
    zqryENTransformerNET4327: TZQuery;
    zqryENTransformerNET4327renname: TWideStringField;
    zqryENTransformerNET4327s04name: TWideStringField;
    zqryENTransformerNET4327s04invnumber: TWideStringField;
    zqryENTransformerNET4327name: TWideStringField;
    zqryENTransformerNET4327matname: TWideStringField;
    zqryENTransformerNET4327nominalpower: TFloatField;
    zqryENTransformerNET4327highvoltage: TFloatField;
    zqryENTransformerNET4327lowvoltage: TFloatField;
    zqryENTransformerNET4327highcurrent: TFloatField;
    zqryENTransformerNET4327lowcurrent: TFloatField;
    zqryENTransformerNET4327ukz: TFloatField;
    zqryENTransformerNET4327serialnumber: TWideStringField;
    zqryENTransformerNET4327manufactureyear: TDateField;
    zqryENTransformerNET4327installdate: TDateField;
    zqryENTransformerNET4327removaldate: TDateField;
    zqryENTransformerNET4327remark: TStringField;
    frxDBDsENAutomat: TfrxDBDataset;
    zqryENAutomatNET4139: TZQuery;
    frxRENSubstation04Components: TfrxReport;
    zqryENAutomatNET4139automatcode: TFloatField;
    zqryENAutomatNET4139renname: TWideStringField;
    zqryENAutomatNET4139substation04name: TWideStringField;
    zqryENAutomatNET4139substation04invnumber: TWideStringField;
    zqryENAutomatNET4139pnlname: TWideStringField;
    zqryENAutomatNET4139branchlvbname: TWideStringField;
    zqryENAutomatNET4139name: TWideStringField;
    zqryENAutomatNET4139matname: TWideStringField;
    zqryENAutomatNET4139thermalsplittercurrent: TFloatField;
    zqryENAutomatNET4139markcurrent: TFloatField;
    zqryENAutomatNET4139additional: TWideMemoField;
    frxRENSubstation04Transformers: TfrxReport;
    frxRENSubstation04Automats: TfrxReport;
    zqryLoadS04ReservPack: TZQuery;
    frxDBDsLoadS04ReservPack: TfrxDBDataset;
    zqryLoadS04ReservPackname: TWideStringField;
    zqryLoadS04ReservPackdescription: TWideStringField;
    zqryLoadS04ReservPackadres: TWideStringField;
    zqryLoadS04ReservPackpower: TFloatField;
    zqryLoadS04ReservPackpow_exist: TFloatField;
    zqryLoadS04ReservPacktrcnt: TLargeintField;
    zqryLoadS04ReservPackline04name: TWideStringField;
    zqryLoadS04ReservPackline04invnumber: TWideStringField;
    zqryLoadS04ReservPacklinecablename: TWideStringField;
    zqryLoadS04ReservPacklinecableinvnumber: TWideStringField;
    zqryLoadS04ReservPacks04name: TWideStringField;
    zqryLoadS04ReservPacks04invnumber: TWideStringField;
    zqryLoadS04ReservPackcode_substation04: TFloatField;
    zqryLoadS04ReservPackline10name: TWideStringField;
    zqryLoadS04ReservPackline10invnumber: TWideStringField;
    zqryLoadS04ReservPacklinecable10name: TWideStringField;
    zqryLoadS04ReservPacklinecable10invnumber: TWideStringField;
    zqryLoadS04ReservPacks35name: TWideStringField;
    zqryLoadS04ReservPacks35invnumber: TWideStringField;
    zqryLoadS04ReservPackline150name: TWideStringField;
    zqryLoadS04ReservPackline150invnumber: TWideStringField;
    zqryLoadS04ReservPacklinecable150name: TWideStringField;
    zqryLoadS04ReservPacklinecable150invnumber: TWideStringField;
    zqryLoadS04ReservPacks150_35name: TWideStringField;
    zqryLoadS04ReservPacks150_35invnumber: TWideStringField;
    zqryLoadS04ReservPackcode_transformer: TFloatField;
    zqryLoadS04ReservPacktrmaxpower: TFloatField;
    zqryLoadS04ReservPackcode_line04: TFloatField;
    zqryLoadS04ReservPackcode_linecable: TFloatField;
    zqryLoadS04ReservPackcode_line10: TFloatField;
    zqryLoadS04ReservPackcode_linecable10: TFloatField;
    zqryLoadS04ReservPackcode_substation35: TFloatField;
    zqryLoadS04ReservPackcode_line150: TFloatField;
    zqryLoadS04ReservPackcode_linecable150: TFloatField;
    zqryLoadS04ReservPackcode_ss150_35: TFloatField;
    zqryLoadS04ReservPackcountcustomer: TFloatField;
    zqryLoadS04ReservPackpowercontracttotal: TFloatField;
    zqryLoadS04ReservPackefficiency: TFloatField;
    dsLoadS04ReservPack: TDataSource;
    frxDBDsLoadS04ReservENTransformer: TfrxDBDataset;
    zqryLoadS04ReservENTransformer: TZQuery;
    frxDBDsLoadS04ReservENTrPowStr: TfrxDBDataset;
    zqryLoadS04ReservENTrPowStr: TZQuery;
    dsLoadS04ReservTransformer: TDataSource;
    zqryLoadS04ReservTrPacks: TZQuery;
    frxDBDsLoadS04ReservTrPacks: TfrxDBDataset;
    zqryLoadS04ReservTrPackscode_transformer: TFloatField;
    zqryLoadS04ReservTrPacksid_pack: TFloatField;
    zqryLoadS04ReservTrPacksname: TWideStringField;
    zqryLoadS04ReservTrPacksreg_num_tu_contract: TWideStringField;
    zqryLoadS04ReservTrPacksdate_tu_contract: TDateField;
    zqryLoadS04ReservTrPackspower: TFloatField;
    zqryLoadS04ReservTrPackspow_exist: TFloatField;
    zqryLoadS04ReservTrPacksis_realized: TIntegerField;
    zqryLoadS04ReservTrPacksid_ss: TIntegerField;
    zqryLoadS04ReservTrPacksname_ss: TWideMemoField;
    zqryLoadS04ReservENTransformertrnumber: TWideMemoField;
    zqryLoadS04ReservENTransformercode_transformer: TFloatField;
    zqryLoadS04ReservENTransformernominalpower: TFloatField;
    zqryLoadS04ReservENTransformerinvnumber: TWideStringField;
    zqryLoadS04ReservENTransformermatname: TWideStringField;
    zqryLoadS04ReservENTransformercurrentphasemax: TFloatField;
    zqryLoadS04ReservENTransformercurrentphasegreen: TFloatField;
    zqryLoadS04ReservENTransformercurrentphasered: TFloatField;
    zqryLoadS04ReservENTransformercurrentphaseyellow: TFloatField;
    zqryLoadS04ReservENTransformercurrentphasemaxcorrect: TFloatField;
    zqryLoadS04ReservENTransformernominaltension: TFloatField;
    zqryLoadS04ReservENTransformerpowercoefficient: TFloatField;
    zqryLoadS04ReservENTransformerpowermeasurement: TFloatField;
    zqryLoadS04ReservENTransformercode_substation04: TFloatField;
    zqryLoadS04ReservTrPacksAgreg: TZQuery;
    frxDBDsLoadS04ReservTrPacksAgreg: TfrxDBDataset;
    zqryLoadS04ReservPackid_pack: TFloatField;
    zqryLoadS04ReservTrPacksAgregloadstart: TWideMemoField;
    zqryLoadS04ReservTrPacksAgregtrload: TWideMemoField;
    frxDBDsLoadS04ReservTrPacksRealiz: TfrxDBDataset;
    zqryLoadS04ReservTrPacksRealiz: TZQuery;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    DateField6: TDateField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    WideMemoField7: TWideMemoField;
    frxRENSubstation04Lines04: TfrxReport;
    frxDBDsENSubstation04AirCable04: TfrxDBDataset;
    zqryENLine04NET4346: TZQuery;
    wdstrngfldENSubstation04Line04NET4346renname: TWideStringField;
    wdstrngfldENSubstation04Line04NET4346name: TWideStringField;
    wdmfldENSubstation04Line04NET4346substation04name: TWideMemoField;
    wdmfldENSubstation04Line04NET4346substation04invnumber: TWideMemoField;
    wdmfldENSubstation04Line04NET4346s04address: TWideMemoField;
    wdmfldENSubstation04Line04NET4346terraintype: TWideMemoField;
    wdmfldENSubstation04Line04NET4346branchnumbergen: TWideMemoField;
    wdmfldENSubstation04Line04NET4346branchtype: TWideMemoField;
    wdmfldENSubstation04Line04NET4346consumercategory: TWideMemoField;
    wdmfldENSubstation04Line04NET4346basicconsumer: TWideMemoField;
    wdmfldPP2DFENSubstation04Line04NET4346permissible_current: TWideMemoField;
    zqryLoadS04ReservPackCN20110314: TZQuery;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    LargeintField1: TLargeintField;
    WideStringField8: TWideStringField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    WideStringField12: TWideStringField;
    WideStringField13: TWideStringField;
    FloatField40: TFloatField;
    WideStringField14: TWideStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    WideStringField17: TWideStringField;
    WideStringField18: TWideStringField;
    WideStringField19: TWideStringField;
    WideStringField20: TWideStringField;
    WideStringField21: TWideStringField;
    WideStringField22: TWideStringField;
    WideStringField23: TWideStringField;
    WideStringField24: TWideStringField;
    WideStringField25: TWideStringField;
    FloatField41: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    FloatField62: TFloatField;
    zqryLoadS04ReservPackNCN: TZQuery;
    WideStringField26: TWideStringField;
    WideStringField27: TWideStringField;
    WideStringField28: TWideStringField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    LargeintField2: TLargeintField;
    WideStringField29: TWideStringField;
    WideStringField30: TWideStringField;
    WideStringField31: TWideStringField;
    WideStringField32: TWideStringField;
    WideStringField33: TWideStringField;
    WideStringField34: TWideStringField;
    FloatField65: TFloatField;
    WideStringField35: TWideStringField;
    WideStringField36: TWideStringField;
    WideStringField37: TWideStringField;
    WideStringField38: TWideStringField;
    WideStringField39: TWideStringField;
    WideStringField40: TWideStringField;
    WideStringField41: TWideStringField;
    WideStringField42: TWideStringField;
    WideStringField43: TWideStringField;
    WideStringField44: TWideStringField;
    WideStringField45: TWideStringField;
    WideStringField46: TWideStringField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    FloatField70: TFloatField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    FloatField77: TFloatField;
    FloatField78: TFloatField;
    FloatField82: TFloatField;
    zqryLoadS04ReservPackCN: TZQuery;
    WideStringField47: TWideStringField;
    WideStringField48: TWideStringField;
    WideStringField49: TWideStringField;
    FloatField83: TFloatField;
    FloatField84: TFloatField;
    LargeintField3: TLargeintField;
    WideStringField50: TWideStringField;
    WideStringField51: TWideStringField;
    WideStringField52: TWideStringField;
    WideStringField53: TWideStringField;
    WideStringField54: TWideStringField;
    WideStringField55: TWideStringField;
    FloatField85: TFloatField;
    WideStringField56: TWideStringField;
    WideStringField57: TWideStringField;
    WideStringField58: TWideStringField;
    WideStringField59: TWideStringField;
    WideStringField60: TWideStringField;
    WideStringField61: TWideStringField;
    WideStringField62: TWideStringField;
    WideStringField63: TWideStringField;
    WideStringField64: TWideStringField;
    WideStringField65: TWideStringField;
    WideStringField66: TWideStringField;
    WideStringField67: TWideStringField;
    FloatField86: TFloatField;
    FloatField87: TFloatField;
    FloatField88: TFloatField;
    FloatField89: TFloatField;
    FloatField90: TFloatField;
    FloatField91: TFloatField;
    FloatField92: TFloatField;
    FloatField93: TFloatField;
    FloatField94: TFloatField;
    FloatField95: TFloatField;
    FloatField96: TFloatField;
    FloatField97: TFloatField;
    FloatField98: TFloatField;
    FloatField102: TFloatField;
    zqryLoadS04ReservTrPacksAgregtrloadwiththispack: TWideMemoField;
    frxRLoadS35Reserv: TfrxReport;
    zqryLoadS35ReservPack: TZQuery;
    frxDBDsLoadS35ReservPack: TfrxDBDataset;
    dsLoadS35ReservPack: TDataSource;
    frxDBDsLoadS35ReservENPowTrans: TfrxDBDataset;
    zqryLoadS35ReservENPowTrans: TZQuery;
    frxDBDsLoadS35ReservENPowTransStr: TfrxDBDataset;
    zqryLoadS35ReservENPowTransStr: TZQuery;
    dsLoadS35ReservENPowTrans: TDataSource;
    zqryLoadS35ReservTrPacks: TZQuery;
    frxDBDsLoadS35ReservTrPacks: TfrxDBDataset;
    zqryLoadS35ReservTrPacksAgreg: TZQuery;
    frxDBDsLoadS35ReservTrPacksAgreg: TfrxDBDataset;
    frxDBDsLoadS35ReservTrPacksRealiz: TfrxDBDataset;
    zqryLoadS35ReservTrPacksRealiz: TZQuery;
    zqryLoadS35ReservPackCN20110314: TZQuery;
    zqryLoadS35ReservPackNCN: TZQuery;
    zqryLoadS35ReservPackCN: TZQuery;
    zqryLoadS35ReservPackid_pack: TFloatField;
    zqryLoadS35ReservPackname: TWideStringField;
    zqryLoadS35ReservPackdescription: TWideStringField;
    zqryLoadS35ReservPackadres: TWideStringField;
    zqryLoadS35ReservPackpower: TFloatField;
    zqryLoadS35ReservPackpow_exist: TFloatField;
    zqryLoadS35ReservPacktrcnt: TLargeintField;
    zqryLoadS35ReservPackcountcustomer: TFloatField;
    zqryLoadS35ReservPackpowercontracttotal: TFloatField;
    zqryLoadS35ReservPackcode_line04: TFloatField;
    zqryLoadS35ReservPackline04name: TWideStringField;
    zqryLoadS35ReservPackline04invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_linecable: TFloatField;
    zqryLoadS35ReservPacklinecablename: TWideStringField;
    zqryLoadS35ReservPacklinecableinvnumber: TWideStringField;
    zqryLoadS35ReservPackcode_substation04: TFloatField;
    zqryLoadS35ReservPacks04name: TWideStringField;
    zqryLoadS35ReservPacks04invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_line10: TFloatField;
    zqryLoadS35ReservPackline10name: TWideStringField;
    zqryLoadS35ReservPackline10invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_linecable10: TFloatField;
    zqryLoadS35ReservPacklinecable10name: TWideStringField;
    zqryLoadS35ReservPacklinecable10invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_substation35: TFloatField;
    zqryLoadS35ReservPacks35name: TWideStringField;
    zqryLoadS35ReservPacks35invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_line150: TFloatField;
    zqryLoadS35ReservPackline150name: TWideStringField;
    zqryLoadS35ReservPackline150invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_linecable150: TFloatField;
    zqryLoadS35ReservPacklinecable150name: TWideStringField;
    zqryLoadS35ReservPacklinecable150invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_ss150_35: TFloatField;
    zqryLoadS35ReservPacks150_35name: TWideStringField;
    zqryLoadS35ReservPacks150_35invnumber: TWideStringField;
    zqryLoadS35ReservPackcode_st35powertrans: TFloatField;
    zqryLoadS35ReservPacktrmaxpower: TFloatField;
    zqryLoadS35ReservPackefficiency: TFloatField;
    zqryLoadS35ReservPackCN20110314id_pack: TFloatField;
    zqryLoadS35ReservPackCN20110314name: TWideStringField;
    zqryLoadS35ReservPackCN20110314description: TWideStringField;
    zqryLoadS35ReservPackCN20110314adres: TWideStringField;
    zqryLoadS35ReservPackCN20110314power: TFloatField;
    zqryLoadS35ReservPackCN20110314pow_exist: TFloatField;
    zqryLoadS35ReservPackCN20110314trcnt: TLargeintField;
    zqryLoadS35ReservPackCN20110314countcustomer: TFloatField;
    zqryLoadS35ReservPackCN20110314powercontracttotal: TFloatField;
    zqryLoadS35ReservPackCN20110314code_line04: TFloatField;
    zqryLoadS35ReservPackCN20110314line04name: TWideStringField;
    zqryLoadS35ReservPackCN20110314line04invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_linecable: TFloatField;
    zqryLoadS35ReservPackCN20110314linecablename: TWideStringField;
    zqryLoadS35ReservPackCN20110314linecableinvnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_substation04: TFloatField;
    zqryLoadS35ReservPackCN20110314s04name: TWideStringField;
    zqryLoadS35ReservPackCN20110314s04invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_line10: TFloatField;
    zqryLoadS35ReservPackCN20110314line10name: TWideStringField;
    zqryLoadS35ReservPackCN20110314line10invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_linecable10: TFloatField;
    zqryLoadS35ReservPackCN20110314linecable10name: TWideStringField;
    zqryLoadS35ReservPackCN20110314linecable10invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_substation35: TFloatField;
    zqryLoadS35ReservPackCN20110314s35name: TWideStringField;
    zqryLoadS35ReservPackCN20110314s35invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_line150: TFloatField;
    zqryLoadS35ReservPackCN20110314line150name: TWideStringField;
    zqryLoadS35ReservPackCN20110314line150invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_linecable150: TFloatField;
    zqryLoadS35ReservPackCN20110314linecable150name: TWideStringField;
    zqryLoadS35ReservPackCN20110314linecable150invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_ss150_35: TFloatField;
    zqryLoadS35ReservPackCN20110314s150_35name: TWideStringField;
    zqryLoadS35ReservPackCN20110314s150_35invnumber: TWideStringField;
    zqryLoadS35ReservPackCN20110314code_st35powertrans: TFloatField;
    zqryLoadS35ReservPackCN20110314trmaxpower: TFloatField;
    zqryLoadS35ReservPackCN20110314efficiency: TFloatField;
    zqryLoadS35ReservPackNCNid_pack: TFloatField;
    zqryLoadS35ReservPackNCNname: TWideStringField;
    zqryLoadS35ReservPackNCNdescription: TWideStringField;
    zqryLoadS35ReservPackNCNadres: TWideStringField;
    zqryLoadS35ReservPackNCNpower: TFloatField;
    zqryLoadS35ReservPackNCNpow_exist: TFloatField;
    zqryLoadS35ReservPackNCNtrcnt: TLargeintField;
    zqryLoadS35ReservPackNCNcountcustomer: TFloatField;
    zqryLoadS35ReservPackNCNpowercontracttotal: TFloatField;
    zqryLoadS35ReservPackNCNcode_line04: TFloatField;
    zqryLoadS35ReservPackNCNline04name: TWideStringField;
    zqryLoadS35ReservPackNCNline04invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_linecable: TFloatField;
    zqryLoadS35ReservPackNCNlinecablename: TWideStringField;
    zqryLoadS35ReservPackNCNlinecableinvnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_substation04: TFloatField;
    zqryLoadS35ReservPackNCNs04name: TWideStringField;
    zqryLoadS35ReservPackNCNs04invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_line10: TFloatField;
    zqryLoadS35ReservPackNCNline10name: TWideStringField;
    zqryLoadS35ReservPackNCNline10invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_linecable10: TFloatField;
    zqryLoadS35ReservPackNCNlinecable10name: TWideStringField;
    zqryLoadS35ReservPackNCNlinecable10invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_substation35: TFloatField;
    zqryLoadS35ReservPackNCNs35name: TWideStringField;
    zqryLoadS35ReservPackNCNs35invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_line150: TFloatField;
    zqryLoadS35ReservPackNCNline150name: TWideStringField;
    zqryLoadS35ReservPackNCNline150invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_linecable150: TFloatField;
    zqryLoadS35ReservPackNCNlinecable150name: TWideStringField;
    zqryLoadS35ReservPackNCNlinecable150invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_ss150_35: TFloatField;
    zqryLoadS35ReservPackNCNs150_35name: TWideStringField;
    zqryLoadS35ReservPackNCNs150_35invnumber: TWideStringField;
    zqryLoadS35ReservPackNCNcode_st35powertrans: TFloatField;
    zqryLoadS35ReservPackNCNtrmaxpower: TFloatField;
    zqryLoadS35ReservPackNCNefficiency: TFloatField;
    zqryLoadS35ReservPackCNid_pack: TFloatField;
    zqryLoadS35ReservPackCNname: TWideStringField;
    zqryLoadS35ReservPackCNdescription: TWideStringField;
    zqryLoadS35ReservPackCNadres: TWideStringField;
    zqryLoadS35ReservPackCNpower: TFloatField;
    zqryLoadS35ReservPackCNpow_exist: TFloatField;
    zqryLoadS35ReservPackCNtrcnt: TLargeintField;
    zqryLoadS35ReservPackCNcountcustomer: TFloatField;
    zqryLoadS35ReservPackCNpowercontracttotal: TFloatField;
    zqryLoadS35ReservPackCNcode_line04: TFloatField;
    zqryLoadS35ReservPackCNline04name: TWideStringField;
    zqryLoadS35ReservPackCNline04invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_linecable: TFloatField;
    zqryLoadS35ReservPackCNlinecablename: TWideStringField;
    zqryLoadS35ReservPackCNlinecableinvnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_substation04: TFloatField;
    zqryLoadS35ReservPackCNs04name: TWideStringField;
    zqryLoadS35ReservPackCNs04invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_line10: TFloatField;
    zqryLoadS35ReservPackCNline10name: TWideStringField;
    zqryLoadS35ReservPackCNline10invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_linecable10: TFloatField;
    zqryLoadS35ReservPackCNlinecable10name: TWideStringField;
    zqryLoadS35ReservPackCNlinecable10invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_substation35: TFloatField;
    zqryLoadS35ReservPackCNs35name: TWideStringField;
    zqryLoadS35ReservPackCNs35invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_line150: TFloatField;
    zqryLoadS35ReservPackCNline150name: TWideStringField;
    zqryLoadS35ReservPackCNline150invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_linecable150: TFloatField;
    zqryLoadS35ReservPackCNlinecable150name: TWideStringField;
    zqryLoadS35ReservPackCNlinecable150invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_ss150_35: TFloatField;
    zqryLoadS35ReservPackCNs150_35name: TWideStringField;
    zqryLoadS35ReservPackCNs150_35invnumber: TWideStringField;
    zqryLoadS35ReservPackCNcode_st35powertrans: TFloatField;
    zqryLoadS35ReservPackCNtrmaxpower: TFloatField;
    zqryLoadS35ReservPackCNefficiency: TFloatField;
    zqryLoadS35ReservTrPacksAgregloadstart: TWideMemoField;
    zqryLoadS35ReservTrPacksAgregtrloadwiththispack: TWideMemoField;
    zqryLoadS35ReservTrPacksAgregtrload: TWideMemoField;
    wdmfldLoadS35ReservENPowTransStrtrpowers: TWideMemoField;
    wdmfldLoadS35ReservENPowTransStrtrgaugecurrent: TWideMemoField;
    wdmfldLoadS35ReservENPowTransStrtrpowersmeasurement: TWideMemoField;
    zqryLoadS35ReservTrPackscode_st35powertrans: TFloatField;
    zqryLoadS35ReservTrPacksid_pack: TFloatField;
    zqryLoadS35ReservTrPacksname: TWideStringField;
    zqryLoadS35ReservTrPacksreg_num_tu_contract: TWideStringField;
    zqryLoadS35ReservTrPacksdate_tu_contract: TDateField;
    zqryLoadS35ReservTrPackspower: TFloatField;
    zqryLoadS35ReservTrPackspow_exist: TFloatField;
    zqryLoadS35ReservTrPacksis_realized: TIntegerField;
    zqryLoadS35ReservTrPacksid_ss: TIntegerField;
    zqryLoadS35ReservTrPacksname_ss: TWideMemoField;
    zqryLoadS35ReservTrPacksRealizcode_st35powertrans: TFloatField;
    zqryLoadS35ReservTrPacksRealizid_pack: TFloatField;
    zqryLoadS35ReservTrPacksRealizname: TWideStringField;
    zqryLoadS35ReservTrPacksRealizreg_num_tu_contract: TWideStringField;
    zqryLoadS35ReservTrPacksRealizdate_tu_contract: TDateField;
    zqryLoadS35ReservTrPacksRealizpower: TFloatField;
    zqryLoadS35ReservTrPacksRealizpow_exist: TFloatField;
    zqryLoadS35ReservTrPacksRealizis_realized: TIntegerField;
    zqryLoadS35ReservTrPacksRealizid_ss: TIntegerField;
    zqryLoadS35ReservTrPacksRealizname_ss: TWideMemoField;
    zqryLoadS35ReservENPowTranstrnumber: TWideMemoField;
    zqryLoadS35ReservENPowTranscode_st35powertrans: TFloatField;
    zqryLoadS35ReservENPowTranscode_substation35: TFloatField;
    zqryLoadS35ReservENPowTranspower: TFloatField;
    zqryLoadS35ReservENPowTransfactorynumber: TWideStringField;
    zqryLoadS35ReservENPowTransmatname: TWideStringField;
    zqryLoadS35ReservENPowTransgaugecurrent: TFloatField;
    zqryLoadS35ReservENPowTransgaugetension: TFloatField;
    zqryLoadS35ReservENPowTranspowercoefficient: TFloatField;
    zqryLoadS35ReservENPowTranspowermeasurement: TFloatField;
    zqryLoadS35ReservENPowTransdategauge: TDateField;
    zqryLoadS04ReservENTransformerdateguage: TDateField;
    zqryLoadS35ReservENPowTranspointtransgaugecurrent: TFloatField;
    zqryLoadS35ReservENPowTranspointtransgaugetension: TFloatField;
    zqryEditEWFGauge150: TZQuery;
    zqryEWFGauge150: TZQuery;
    zqryEWFGauge150code: TFloatField;
    zqryEWFGauge150substation150refcode: TFloatField;
    zqryEWFGauge150powertransrefcode: TFloatField;
    zqryEWFGauge150dategauge: TDateTimeField;
    zqryEWFGauge150current: TFloatField;
    zqryEWFGauge150tension: TFloatField;
    zqryEWFGauge150userfio: TWideStringField;
    zqryEWFGauge150dateedit: TDateTimeField;
    zqryEditEWFGauge150edit_ewfgauge150_result: TWideStringField;
    zqryEWFFiderGauge: TZQuery;
    fltfldEWFFiderGaugecode: TFloatField;
    fltfldEWFFiderGaugecurrentphaseyellow: TFloatField;
    fltfldEWFFiderGaugecurrentphasegreen: TFloatField;
    fltfldEWFFiderGaugecurrentphasered: TFloatField;
    fltfldEWFFiderGaugetensionphaseyellow: TFloatField;
    fltfldEWFFiderGaugetensionphasegreen: TFloatField;
    fltfldEWFFiderGaugetensionphasered: TFloatField;
    fltfldEWFFiderGaugesubstation04code: TFloatField;
    fltfldEWFFiderGaugetransformercode: TFloatField;
    dtmfldEWFFiderGaugedategauge: TDateTimeField;
    wdstrngfldEWFFiderGaugeuserfio: TWideStringField;
    dtmfldEWFFiderGaugedateedit: TDateTimeField;
    zqryEditEWFFiderGauge: TZQuery;
    fltfldLoadS04ReservENTransformertensionphasegreen: TFloatField;
    fltfldLoadS04ReservENTransformertensionphasered: TFloatField;
    fltfldLoadS04ReservENTransformertensionphaseyellow: TFloatField;
    wdmfldLoadS04ReservENTrPowStrtrpowers: TWideMemoField;
    wdmfldLoadS04ReservENTrPowStrtrcurrentsphasemaxcorrect: TWideMemoField;
    wdmfldLoadS04ReservENTrPowStrtrpowersmeasurement: TWideMemoField;
    wdstrngfldEditEWFFiderGaugeedit_ewffidergauge_result: TWideStringField;
    frxRAL04ReconstRegPRIC608: TfrxReport;
    frxDBDsAL04ReconstRegPRIC608: TfrxDBDataset;
    zqryPackTechReq: TZQuery;
    zqryAL04BuildMaterial: TZQuery;
    zqryAL04ReconstMaterial: TZQuery;
    zqryAL04InputMaterial: TZQuery;
    dsPackTechReq: TDataSource;
    zqryAL04: TZQuery;
    zqryAL04al04name: TWideStringField;
    zqryAL04ActPack: TZQuery;
    zqryPackTechReqcode_line04: TFloatField;
    zqryPackTechReqid_subsystem: TIntegerField;
    zqryPackTechReqid_pack: TFloatField;
    zqryPackTechReqironconcretebuildlength: TFloatField;
    zqryPackTechReqmatwirebuildrefcode: TFloatField;
    zqryPackTechReqironconcretereconstlength: TFloatField;
    zqryPackTechReqmatwirereconstructrefcode: TFloatField;
    zqryPackTechReqin_04: TFloatField;
    zqryPackTechReqvl_04: TFloatField;
    zqryPackTechReqmatwireinputrefcode: TFloatField;
    zqryPackTechReqreg_num_cn_contract: TWideStringField;
    zqryPackTechReqpackname: TWideStringField;
    frxDBDsAL04BuildMaterial: TfrxDBDataset;
    frxDBDsAL04ReconstMaterial: TfrxDBDataset;
    frxDBDsAL04InputMaterial: TfrxDBDataset;
    frxDBDsAL04ActPack: TfrxDBDataset;
    zqryAL04BuildMaterialmatwirebuildrefname: TWideStringField;
    zqryAL04ReconstMaterialmatwirereconstructrefname: TWideStringField;
    zqryAL04InputMaterialmatwireinputrefname: TWideStringField;
    zqryAL04ActPackactnumbergen: TWideStringField;
    zqryAL04ActPackreconstructionorbuild: TWideMemoField;
    frxDBDsAL04: TfrxDBDataset;
    frxDBDsAL04ReconstRegTitle: TfrxDBDataset;
    zqryAL04ReconstRegTitle: TZQuery;
    zqryAL04ReconstRegTitlerep_title: TWideMemoField;
    zqryENPowTrans: TZQuery;
    zqryENPowTranspowernn: TFloatField;
    zqryENPowTranspowersn: TFloatField;
    zqryENPowTranspowervn: TFloatField;
    frxRLoadS150Reserv: TfrxReport;
    zqryLoadS150ReservPackEAP: TZQuery;
    frxDBDsLoadS150ReservPack: TfrxDBDataset;
    dsLoadS150ReservPack: TDataSource;
    frxDBDsLoadS150ReservENPowTrans: TfrxDBDataset;
    zqryLoadS150ReservENPowTrans: TZQuery;
    frxDBDsLoadS150ReservENPowTransStr: TfrxDBDataset;
    zqryLoadS150ReservENPowTransStr: TZQuery;
    dsLoadS150ReservENPowTrans: TDataSource;
    zqryLoadS150ReservTrPacks: TZQuery;
    frxDBDsLoadS150ReservTrPacks: TfrxDBDataset;
    zqryLoadS150ReservTrPacksAgreg: TZQuery;
    frxDBDsLoadS150ReservTrPacksAgreg: TfrxDBDataset;
    frxDBDsLoadS150ReservTrPacksRealiz: TfrxDBDataset;
    zqryLoadS150ReservTrPacksRealiz: TZQuery;
    zqryLoadS150ReservPackCN20110314: TZQuery;
    zqryLoadS150ReservPackNCN: TZQuery;
    zqryLoadS150ReservPackCN: TZQuery;
    zqryLoadS150ReservPackEAPid_pack: TFloatField;
    zqryLoadS150ReservPackEAPname: TWideStringField;
    zqryLoadS150ReservPackEAPdescription: TWideStringField;
    zqryLoadS150ReservPackEAPadres: TWideStringField;
    zqryLoadS150ReservPackEAPpower: TFloatField;
    zqryLoadS150ReservPackEAPpow_exist: TFloatField;
    zqryLoadS150ReservPackEAPtrcnt: TLargeintField;
    zqryLoadS150ReservPackEAPcountcustomer: TFloatField;
    zqryLoadS150ReservPackEAPpowercontracttotal: TFloatField;
    zqryLoadS150ReservPackEAPcode_line04: TFloatField;
    zqryLoadS150ReservPackEAPline04name: TWideStringField;
    zqryLoadS150ReservPackEAPline04invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_linecable: TFloatField;
    zqryLoadS150ReservPackEAPlinecablename: TWideStringField;
    zqryLoadS150ReservPackEAPlinecableinvnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_substation04: TFloatField;
    zqryLoadS150ReservPackEAPs04name: TWideStringField;
    zqryLoadS150ReservPackEAPs04invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_line10: TFloatField;
    zqryLoadS150ReservPackEAPline10name: TWideStringField;
    zqryLoadS150ReservPackEAPline10invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_linecable10: TFloatField;
    zqryLoadS150ReservPackEAPlinecable10name: TWideStringField;
    zqryLoadS150ReservPackEAPlinecable10invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_substation35: TFloatField;
    zqryLoadS150ReservPackEAPs35name: TWideStringField;
    zqryLoadS150ReservPackEAPs35invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_line150: TFloatField;
    zqryLoadS150ReservPackEAPline150name: TWideStringField;
    zqryLoadS150ReservPackEAPline150invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_linecable150: TFloatField;
    zqryLoadS150ReservPackEAPlinecable150name: TWideStringField;
    zqryLoadS150ReservPackEAPlinecable150invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_st35powertrans: TFloatField;
    zqryLoadS150ReservPackEAPcode_st150powertrans: TFloatField;
    zqryLoadS150ReservPackEAPtrmaxpower: TFloatField;
    zqryLoadS150ReservPackCN20110314id_pack: TFloatField;
    zqryLoadS150ReservPackCN20110314name: TWideStringField;
    zqryLoadS150ReservPackCN20110314description: TWideStringField;
    zqryLoadS150ReservPackCN20110314adres: TWideStringField;
    zqryLoadS150ReservPackCN20110314power: TFloatField;
    zqryLoadS150ReservPackCN20110314pow_exist: TFloatField;
    zqryLoadS150ReservPackCN20110314trcnt: TLargeintField;
    zqryLoadS150ReservPackCN20110314countcustomer: TFloatField;
    zqryLoadS150ReservPackCN20110314powercontracttotal: TFloatField;
    zqryLoadS150ReservPackCN20110314code_line04: TFloatField;
    zqryLoadS150ReservPackCN20110314line04name: TWideStringField;
    zqryLoadS150ReservPackCN20110314line04invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_linecable: TFloatField;
    zqryLoadS150ReservPackCN20110314linecablename: TWideStringField;
    zqryLoadS150ReservPackCN20110314linecableinvnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_substation04: TFloatField;
    zqryLoadS150ReservPackCN20110314s04name: TWideStringField;
    zqryLoadS150ReservPackCN20110314s04invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_line10: TFloatField;
    zqryLoadS150ReservPackCN20110314line10name: TWideStringField;
    zqryLoadS150ReservPackCN20110314line10invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_linecable10: TFloatField;
    zqryLoadS150ReservPackCN20110314linecable10name: TWideStringField;
    zqryLoadS150ReservPackCN20110314linecable10invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_substation35: TFloatField;
    zqryLoadS150ReservPackCN20110314s35name: TWideStringField;
    zqryLoadS150ReservPackCN20110314s35invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_line150: TFloatField;
    zqryLoadS150ReservPackCN20110314line150name: TWideStringField;
    zqryLoadS150ReservPackCN20110314line150invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_linecable150: TFloatField;
    zqryLoadS150ReservPackCN20110314linecable150name: TWideStringField;
    zqryLoadS150ReservPackCN20110314linecable150invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_st35powertrans: TFloatField;
    zqryLoadS150ReservPackCN20110314code_st150powertrans: TFloatField;
    zqryLoadS150ReservPackCN20110314trmaxpower: TFloatField;
    zqryLoadS150ReservPackCN20110314efficiency: TFloatField;
    zqryLoadS150ReservPackNCNid_pack: TFloatField;
    zqryLoadS150ReservPackNCNname: TWideStringField;
    zqryLoadS150ReservPackNCNdescription: TWideStringField;
    zqryLoadS150ReservPackNCNadres: TWideStringField;
    zqryLoadS150ReservPackNCNpower: TFloatField;
    zqryLoadS150ReservPackNCNpow_exist: TFloatField;
    zqryLoadS150ReservPackNCNtrcnt: TLargeintField;
    zqryLoadS150ReservPackNCNcountcustomer: TFloatField;
    zqryLoadS150ReservPackNCNpowercontracttotal: TFloatField;
    zqryLoadS150ReservPackNCNcode_line04: TFloatField;
    zqryLoadS150ReservPackNCNline04name: TWideStringField;
    zqryLoadS150ReservPackNCNline04invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_linecable: TFloatField;
    zqryLoadS150ReservPackNCNlinecablename: TWideStringField;
    zqryLoadS150ReservPackNCNlinecableinvnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_substation04: TFloatField;
    zqryLoadS150ReservPackNCNs04name: TWideStringField;
    zqryLoadS150ReservPackNCNs04invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_line10: TFloatField;
    zqryLoadS150ReservPackNCNline10name: TWideStringField;
    zqryLoadS150ReservPackNCNline10invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_linecable10: TFloatField;
    zqryLoadS150ReservPackNCNlinecable10name: TWideStringField;
    zqryLoadS150ReservPackNCNlinecable10invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_substation35: TFloatField;
    zqryLoadS150ReservPackNCNs35name: TWideStringField;
    zqryLoadS150ReservPackNCNs35invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_line150: TFloatField;
    zqryLoadS150ReservPackNCNline150name: TWideStringField;
    zqryLoadS150ReservPackNCNline150invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_linecable150: TFloatField;
    zqryLoadS150ReservPackNCNlinecable150name: TWideStringField;
    zqryLoadS150ReservPackNCNlinecable150invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_st35powertrans: TFloatField;
    zqryLoadS150ReservPackNCNcode_st150powertrans: TFloatField;
    zqryLoadS150ReservPackNCNtrmaxpower: TFloatField;
    zqryLoadS150ReservPackNCNefficiency: TFloatField;
    zqryLoadS150ReservPackCNid_pack: TFloatField;
    zqryLoadS150ReservPackCNname: TWideStringField;
    zqryLoadS150ReservPackCNdescription: TWideStringField;
    zqryLoadS150ReservPackCNadres: TWideStringField;
    zqryLoadS150ReservPackCNpower: TFloatField;
    zqryLoadS150ReservPackCNpow_exist: TFloatField;
    zqryLoadS150ReservPackCNtrcnt: TLargeintField;
    zqryLoadS150ReservPackCNcountcustomer: TFloatField;
    zqryLoadS150ReservPackCNpowercontracttotal: TFloatField;
    zqryLoadS150ReservPackCNcode_line04: TFloatField;
    zqryLoadS150ReservPackCNline04name: TWideStringField;
    zqryLoadS150ReservPackCNline04invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_linecable: TFloatField;
    zqryLoadS150ReservPackCNlinecablename: TWideStringField;
    zqryLoadS150ReservPackCNlinecableinvnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_substation04: TFloatField;
    zqryLoadS150ReservPackCNs04name: TWideStringField;
    zqryLoadS150ReservPackCNs04invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_line10: TFloatField;
    zqryLoadS150ReservPackCNline10name: TWideStringField;
    zqryLoadS150ReservPackCNline10invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_linecable10: TFloatField;
    zqryLoadS150ReservPackCNlinecable10name: TWideStringField;
    zqryLoadS150ReservPackCNlinecable10invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_substation35: TFloatField;
    zqryLoadS150ReservPackCNs35name: TWideStringField;
    zqryLoadS150ReservPackCNs35invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_line150: TFloatField;
    zqryLoadS150ReservPackCNline150name: TWideStringField;
    zqryLoadS150ReservPackCNline150invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_linecable150: TFloatField;
    zqryLoadS150ReservPackCNlinecable150name: TWideStringField;
    zqryLoadS150ReservPackCNlinecable150invnumber: TWideStringField;
    zqryLoadS150ReservPackCNcode_st35powertrans: TFloatField;
    zqryLoadS150ReservPackCNcode_st150powertrans: TFloatField;
    zqryLoadS150ReservPackCNtrmaxpower: TFloatField;
    zqryLoadS150ReservPackCNefficiency: TFloatField;
    zqryLoadS150ReservTrPacksAgregloadstart: TWideMemoField;
    zqryLoadS150ReservTrPacksAgregtrloadwiththispack: TWideMemoField;
    zqryLoadS150ReservTrPacksAgregtrload: TWideMemoField;
    zqryLoadS150ReservENPowTranstrnumber: TWideMemoField;
    zqryLoadS150ReservENPowTranscode_st150powertrans: TFloatField;
    zqryLoadS150ReservENPowTranscode_ss150: TFloatField;
    zqryLoadS150ReservENPowTranspower: TFloatField;
    zqryLoadS150ReservENPowTransfactorynumber: TWideStringField;
    zqryLoadS150ReservENPowTransmatname: TWideStringField;
    zqryLoadS150ReservENPowTransgaugecurrent: TFloatField;
    zqryLoadS150ReservENPowTranspointtransgaugecurrent: TFloatField;
    zqryLoadS150ReservENPowTransgaugetension: TFloatField;
    zqryLoadS150ReservENPowTranspointtransgaugetension: TFloatField;
    zqryLoadS150ReservENPowTranspowercoefficient: TFloatField;
    zqryLoadS150ReservENPowTranspowermeasurement: TFloatField;
    zqryLoadS150ReservENPowTransdategauge: TDateField;
    zqryLoadS150ReservENPowTransStrtrpowers: TWideMemoField;
    zqryLoadS150ReservENPowTransStrtrgaugecurrent: TWideMemoField;
    zqryLoadS150ReservENPowTransStrtrpowersmeasurement: TWideMemoField;
    zqryLoadS150ReservTrPacksRealizcode_st150powertrans: TFloatField;
    zqryLoadS150ReservTrPacksRealizid_pack: TFloatField;
    zqryLoadS150ReservTrPacksRealizname: TWideStringField;
    zqryLoadS150ReservTrPacksRealizreg_num_tu_contract: TWideStringField;
    zqryLoadS150ReservTrPacksRealizdate_tu_contract: TDateField;
    zqryLoadS150ReservTrPacksRealizpower: TFloatField;
    zqryLoadS150ReservTrPacksRealizpow_exist: TFloatField;
    zqryLoadS150ReservTrPacksRealizis_realized: TIntegerField;
    zqryLoadS150ReservTrPacksRealizid_ss: TIntegerField;
    zqryLoadS150ReservTrPacksRealizname_ss: TWideMemoField;
    zqryLoadS150ReservPackCNcode_ss150: TFloatField;
    zqryLoadS150ReservPackCNss150name: TWideStringField;
    zqryLoadS150ReservPackCNss150invnumber: TWideStringField;
    zqryLoadS150ReservPackNCNcode_ss150: TFloatField;
    zqryLoadS150ReservPackNCNss150name: TWideStringField;
    zqryLoadS150ReservPackNCNss150invnumber: TWideStringField;
    zqryLoadS150ReservPackCN20110314code_ss150: TFloatField;
    zqryLoadS150ReservPackCN20110314ss150name: TWideStringField;
    zqryLoadS150ReservPackCN20110314ss150invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPcode_ss150: TFloatField;
    zqryLoadS150ReservPackEAPss150name: TWideStringField;
    zqryLoadS150ReservPackEAPss150invnumber: TWideStringField;
    zqryLoadS150ReservPackEAPefficiency: TFloatField;
    zqryLoadS150ReservTrPackscode_st150powertrans: TFloatField;
    zqryLoadS150ReservTrPacksid_pack: TFloatField;
    zqryLoadS150ReservTrPacksname: TWideStringField;
    zqryLoadS150ReservTrPacksreg_num_tu_contract: TWideStringField;
    zqryLoadS150ReservTrPacksdate_tu_contract: TDateField;
    zqryLoadS150ReservTrPackspower: TFloatField;
    zqryLoadS150ReservTrPackspow_exist: TFloatField;
    zqryLoadS150ReservTrPacksis_realized: TIntegerField;
    zqryLoadS150ReservTrPacksid_ss: TIntegerField;
    zqryLoadS150ReservTrPacksname_ss: TWideMemoField;
    sesEWF: TZConnection;
    zqrySubst150TransformerGaugePowerGenUpd: TZQuery;
    wdmfldSubst150TransformerGaugePowerGenUpdad4subst150upd: TWideMemoField;
    fltfldSubst150TransformerGaugePowerGenUpdvoltage: TFloatField;
    wdstrngfldSubst150TransformerGaugePowerGenUpdrenname: TWideStringField;
    fltfldSubst150TransformerGaugePowerGenUpdsubstation150refcode: TFloatField;
    wdstrngfldSubst150TransformerGaugePowerGenUpdsubstation150name: TWideStringField;
    fltfldSubst150TransformerGaugePowerGenUpdgauge_s04_power_previous: TFloatField;
    fltfldSubst150TransformerGaugePowerGenUpdgauge_s04_power: TFloatField;
    zspSubst150TransformerGaugePowerUpd: TZSQLProcessor;

    procedure frxRTechTermsQuantPowerBeforePrint(
      Sender: TfrxReportComponent);
    procedure frxRTechTermsQuantPowerClosePreview(Sender: TObject);
    procedure frxRTechTermsQuantPowerPreview(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);

    procedure HTTPRIOBeforeExecute(const MethodName: String; var SOAPRequest: WideString);
    procedure HTTPRIOAfterExecute(const MethodName: String; SOAPResponse: TStream);
    procedure HTTPRIOHTTPWebNodeBeforePost(const HTTPReqResp: THTTPReqResp; Data: Pointer);
    procedure frxRSouthEnergySystemPRIC594ClosePreview(Sender: TObject);
    procedure frxRTechTermsQuantPowerDeployedClosePreview(Sender: TObject);
    procedure frxRTechTermsQuantPowerSupplyClosePreview(Sender: TObject);
    procedure frxRENSubstation04ComponentsClosePreview(Sender: TObject);
    procedure frxRENSubstation04TransformersClosePreview(Sender: TObject);
    procedure frxRENSubstation04AutomatsClosePreview(Sender: TObject);
    procedure frxRLoadS04ReservClosePreview(Sender: TObject);
    procedure frxRLoadS04ReservClickObject(Sender: TfrxView;
      Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
    procedure frxRENSubstation04Lines04ClosePreview(Sender: TObject);
    procedure frxRLoadS35ReservClosePreview(Sender: TObject);
    procedure frxRLoadS35ReservClickObject(Sender: TfrxView;
      Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);

    //Процедуры передачи через параметры показателей загрузки понижающих
    //Трансформаторных Станций 150 / 35 - 27, 35 - 27 / 10 - 6 и 10 - 6 / 0,4 кВ
    //из промежуточных таблиц комплекса EnergyWorkFlow в случае отсутствия
    //достоверных данных, совпадающих с протоколами режимных замеров,
    //в таблицах комплекса EnergyNet с возможностью редактирования этих
    //параметров и сохранением их в промежуточные таблицы EnergyWorkFlow.
    //Применяются для формирования загружаемых извне отчётов о Резервах
    //Станций, таких как frxRLoadS35Reserv и frxRLoadS04Reserv соответственно
    procedure St150TransformerQuerySetParam(
      changeOnlyDMVar: Boolean = False); //изменять только переменные модуля
    procedure St35TransformerQuerySetParam(
      changeOnlyDMVar: Boolean = False); //изменять только переменные модуля
    procedure St04TransformerQuerySetParam(
      changeOnlyDMVar: Boolean = False); //изменять только переменные модуля
    procedure frxRAL04ReconstRegPRIC608ClosePreview(Sender: TObject);
    procedure frxRLoadS150ReservClosePreview(Sender: TObject);
    procedure frxRLoadS150ReservClickObject(Sender: TfrxView;
      Button: TMouseButton; Shift: TShiftState; var Modified: Boolean); //изменять только переменные модуля
  private
    { Private declarations }
    procedure SetHTTPRIOProps;
    function AutoChange(s, f, n: String): String; //Замена фрагмента в тексте
    function ReplaceInvalidChar(const sString: String): String; //Исключение непечатаемых символов
  public
    { Public declarations }
    packageID, //Код пакета документов
    movementID, //Код движения
    stateID, //Код состояния    
    codeS04, //Код Трансформаторной Подстанции 10 - 6 / 0,4 кВ
    codeTr, //Код Трансформатора 10 - 6 / 0,4 кВ
    codeS35, //Код Понижающей Станции 35 - 27 / 10 - 6 кВ
    codeSubst35PowerTrans, //Код Трансформатора 35 - 27 / 10 - 6 кВ
    codeS150, //Код Понижающей Станции 150 / 35 - 27 кВ
    codeSubst150PowerTrans: Integer; //Код Трансформатора 150 / 35 - 27 кВ
    vObjS04name: String; vObjS04address: String; vObjS04invNum: String;
    vObjS04nominalPower, vImax: Real;
    vObjL10name: String; vObjL10invNum: String;
    vObjS150name: String; vObjS150invNum: String;
    vCustomerName: String; vCustomerAddress: String;
    hTechTermsQuantPower,
    hTechTermsQuantPowerDeployed,
    hTechTermsQuantPowerSupply,
    hSouthEnergySystemPRIC594,
    hSubstation04Components,
    hSubstation04Transformers,
    hSubstation04Automats,
    hSubstation04LinesAirCable04,
    hLoadS04,
    hLoadS04Reserv,
    hLoadS35Reserv,
    hLoadS150Reserv,
    hAL04ReconstRegPRIC608: HWND;

    //Промежуточные показатели замеров трансформатора 150 / 35 - 27 / 10 - 6 кВ
    vGaugeTension, //Показатель Напряжения в промежуточной таблице, кВ
    vGaugeCurrent, //Показатель Силы Тока в промежуточной таблице, А

    //Промежуточные показатели замеров нагрузки трансформатора 10 - 6 / 0,4 кВ
    vCurPhaseYellow, //Ток жёлтой фазы A в промежуточной таблице, Амперы
    vCurPhaseGreen, //Ток зелёной фазы B в промежуточной таблице, Амперы
    vCurPhaseRed, //Ток красной фазы C в промежуточной таблице, Амперы
    vTensPhaseYellow, //Напряжение жёлтой фазы A, Вольты
    vTensPhaseGreen, //Напряжение зелёной фазы B, Вольты
    vTensPhaseRed, //Напряжение красной фазы C, Вольты

    vPowerCoef: Real;  //Коэффициент мощности
    vDateGauge: TDateTime; //Дата замера в промежуточной таблице
  end;

var isExistENFiderGauge: Boolean; //Наличие официальных данных замеров
  DMReportsENetObject: TDMReportsENetObject;
  subsystemID, //Код подсистемы
  //Количество загруженных интерактивных отчётов из модуля нивизуальных
  LoadReportENetObjectCount: Integer;  //компонентов DataModuleReportsENetObject

implementation

uses DialogFormUnit, Globals, 
  //CNConsts,
  ENFiderGuageController, SetupFormUnit, LoginUnit, IniTools,
  Main, ChildFormUnit, FiderGauge, DataModuleReportsEWF;

const cntPg = 2; //Количество страниц отчётов о загрузке Понижающих Станций
  cntPgLoadS04Reserv = 1; cntPgLoadS35Reserv = 1; cntPgLoadS150Reserv = 1;

var subst35PowerTransCodes, //Массивы кодов Трансформаторов 35 - 27 / 10 - 6 кВ
  subst150PowerTransCodes: array of Integer; //Трансформаторов 150 / 35 - 27 кВ

var //http://10.77.11.28:8080/browse/SUPP-21520. Добавлены строковые переменные:
  strReservStationCalculaterPost : String = //Должность ответственного за
    'Інженер відділу підготовки технічних умов'; //расчёт резерва мощности
  strReservStationCalculater: String = ''; //и его ФИО. Пока константа
    //не заполнена, в расчёте резервов мощностей Понижающих Станций согласно
    //электронных заданий http://10.77.11.28:8080/browse/SUPP-21520; SUPP-23927
    //ФИО ответственного за расчёт по умолчанию присваивается CURRENT_USER_FIO

  strReservStationValidaterPost : String = //Должность подписанта, проверяющего
    'Начальник відділу підготовки технічних умов'; //расчёт резерва мощности
  strReservStationValidater: String = 'Бутенко Олексій Павлович'; //и его ФИО

  //strReservStationValidaterPost2 : String = //Должность 2-го подписанта
  //  'Перший заступник директора технічного'; //расчёта резерва мощности и его
  //strReservStationValidater2: String = 'Мануйленко Віталій Леонідович'; //ФИО

{$R *.dfm}

procedure TDMReportsENetObject.frxRSouthEnergySystemPRIC594ClosePreview(Sender: TObject);
begin
  DMReportsENetObject.hSouthEnergySystemPRIC594 := 0;
  DMReportsENetObject.sesEN.Connected := False;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на 1
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    try //Выгрузка содержащего отчёты модуля невизуальных компонентов
      DMReportsENetObject.Free;
      DMReportsENetObject := nil;
    except
    end;
end;

procedure TDMReportsENetObject.frxRAL04ReconstRegPRIC608ClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hAL04ReconstRegPRIC608 := 0;
  //isFullList := False;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на единицу
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    try //Выгрузка содержащего отчёты модуля невизуальных компонентов
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free;
      DMReportsENetObject := nil;
    except
    end;
end;

procedure TDMReportsENetObject.frxRENSubstation04AutomatsClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hSubstation04Automats := 0;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на 1
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    DMReportsENetObject.sesEN.Connected := False;
end;

procedure TDMReportsENetObject.frxRENSubstation04ComponentsClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hSubstation04Components := 0;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на 1
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    DMReportsENetObject.sesEN.Connected := False;
end;

procedure TDMReportsENetObject.frxRENSubstation04Lines04ClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hSubstation04LinesAirCable04 := 0;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на 1
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    DMReportsENetObject.sesEN.Connected := False;
end;

procedure TDMReportsENetObject.frxRENSubstation04TransformersClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hSubstation04Transformers := 0;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на 1
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    DMReportsENetObject.sesEN.Connected := False;
end;

//Процедура передачи через параметры показателей загрузки понижающих
//Трансформаторных Станций 10 - 6 / 0,4 кВ
//из промежуточной таблиц комплекса EnergyWorkFlow в случае отсутствия
//достоверных данных, совпадающих с протоколами режимных замеров,
//в таблице комплекса EnergyNet с возможностью редактирования этих
//параметров и сохранением их в промежуточную таблицу EnergyWorkFlow.
//Применяется для формирования загружаемых извне отчёт о Резерве
//Трансформаторной Станции, такой как frxRLoadS04Reserv
procedure TDMReportsENetObject.St04TransformerQuerySetParam(
  changeOnlyDMVar: Boolean = False); //изменять только переменные модуля
begin
  DMReportsENetObject.zqryEWFFiderGauge.Close;
  DMReportsENetObject.zqryEWFFiderGauge.ParamByName(
    'substation04code').AsInteger :=
      DMReportsENetObject.codeS04;
  DMReportsENetObject.zqryEWFFiderGauge.ParamByName(
    'transformercode').AsInteger :=
      DMReportsENetObject.codeTr;
  DMReportsENetObject.zqryEWFFiderGauge.Open;
  if DMReportsENetObject.zqryEWFFiderGauge.RecordCount > 0 then
    begin //Передача параметрам показателей промежуточной таблицы
      DMReportsENetObject.zqryEWFFiderGauge.First;

      //Напряжение жёлтой фазы A, Вольты
      DMReportsENetObject.vTensPhaseYellow :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'tensionphaseyellow').AsFloat;
      //Ток жёлтой фазы A в промежуточной таблице, Амперы
      DMReportsENetObject.vCurPhaseYellow :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'currentphaseyellow').AsFloat;
      //Напряжение зелёной фазы B, Вольты
      DMReportsENetObject.vTensPhaseGreen :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'tensionphasegreen').AsFloat;
      //Ток зелёной фазы B в промежуточной таблице, Амперы
      DMReportsENetObject.vCurPhaseGreen :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'currentphasegreen').AsFloat;
      //Напряжение зелёной фазы C, Вольты
      DMReportsENetObject.vTensPhaseRed :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'tensionphasered').AsFloat;
      //Ток зелёной фазы C в промежуточной таблице, Амперы
      DMReportsENetObject.vCurPhaseRed :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'currentphasered').AsFloat;

      //DMReportsENetObject.vPowerCoef := 0; //Коэффициент мощности
      DMReportsENetObject.vDateGauge :=
        DMReportsENetObject.zqryEWFFiderGauge.FieldByName(
          'dategauge').AsDateTime; //Дата замера

      if not changeOnlyDMVar then //явно не указано менять только переменные
        begin
          //Передача параметрам запроса списка
          //Силовых Трансформаторов 10 - 6 / 0,4 кВ
          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'dateguage').AsDateTime :=
              DMReportsENetObject.vDateGauge;

          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'tensionphaseyellow').AsFloat :=
              DMReportsENetObject.vTensPhaseYellow;
          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'currentphaseyellow').AsFloat :=
              DMReportsENetObject.vCurPhaseYellow;
          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'tensionphasegreen').AsFloat :=
              DMReportsENetObject.vTensPhaseGreen;
          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'currentphasegreen').AsFloat :=
              DMReportsENetObject.vCurPhaseGreen;
          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'tensionphasered').AsFloat :=
              DMReportsENetObject.vTensPhaseRed;
          DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
            'currentphasered').AsFloat :=
              DMReportsENetObject.vCurPhaseRed;

          //Передача параметрам запроса строчной информации о
          //Силовых Трансформаторах 10 - 6 / 0,4 кВ

          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
            'dateguage').AsDateTime :=
              DMReportsENetObject.vDateGauge;
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
            'currentphaseyellow').AsFloat :=
              DMReportsENetObject.vCurPhaseYellow;
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
            'currentphasegreen').AsFloat :=
              DMReportsENetObject.vCurPhaseGreen;
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
            'currentphasered').AsFloat :=
              DMReportsENetObject.vCurPhaseRed;

          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'dateguage').AsDateTime :=
              DMReportsENetObject.vDateGauge;
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'currentphaseyellow').AsFloat :=
              DMReportsENetObject.vCurPhaseYellow;
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'currentphasegreen').AsFloat :=
              DMReportsENetObject.vCurPhaseGreen;
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'currentphasered').AsFloat :=
              DMReportsENetObject.vCurPhaseRed;
          //DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
          //  'code_transformer').AsInteger := DMReportsENetObject.codeTr;
        end; //if not changeOnlyDMVar then
    end; //if DMReportsENetObject.zqryEWFFiderGauge.RecordCount > 0 then
end; //procedure TDMReportsENetObject.St04TransformerQuerySetParam;

procedure TDMReportsENetObject.frxRLoadS04ReservClickObject(Sender: TfrxView;
  Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
var m: Integer; vChLstBxCtrl, vChLstBxCtrlRealiz,
  vChLstBxCtrlAfterGuaging, vChLstBxCtrlFinish
//  , vChLstBxCtrlPurpose, vChLstBxCtrlPurposeRealiz
  : TfrxCheckListBoxControl;
  subSystemIdArray, packIdArray, subSystemIdRealizArray, packIdRealizArray
//  , subSystemIdPurposeArray, packIdPurposeArray,
//  subSystemIdPurposeRealizArray, packIdPurposeRealizArray,
//  subSystemIdAfterGuagingArray, packIdAfterGuagingArray,
//  subSystemIdFinishArray, packIdFinishArray
  : array of Integer;
  qryTechTermsInsOrUpd: TZQuery; modRes: TModalResult;

  //Строковые переменные передачи значения полей диалоговой формы FastReport
  strCurrentPhaseYellow, //Ток жёлтой фазы A в промежуточной таблице, Амперы
  strCurrentPhaseGreen, //Ток зелёной фазы B в промежуточной таблице, Амперы
  strCurrentPhaseRed, //Ток красной фазы C в промежуточной таблице, Амперы
  strTensionPhaseYellow, //Напряжение жёлтой фазы A, Вольты
  strTensionPhaseGreen, //Напряжение зелёной фазы B, Вольты
  strTensionPhaseRed, //Напряжение красной фазы C, Вольты
  strPowerCoef, //Коэффициент мощности
  strMsg: String; //Текст сообщения об удалении промежуточного замера

  function GetTextOfTfrxMemoControl(mCtrlName: String): String;
  var i, m: Integer; s, f: String; vMC: TfrxMemoControl;
  begin
    vMC := TfrxMemoControl(frxRLoadS04Reserv.FindObject(mCtrlName));
    s := '';
    for i := 0 to vMC.Lines.Count - 1 do
      s := s + vMC.Lines[i];
    Result := s;
  end; //function GetTextOfTfrxMemoControl(mCtrlName: String): String;

begin
  if Button <> mbLeft then
    Exit;
  if (Sender.Name = 'PictureLightning') then
    begin
      //Инициализация строковых переменных для предотвращения неправильной
      //передачи значения полей диалоговой формы FastReport
      strCurrentPhaseYellow := ''; //Ток жёлтой фазы A, Амперы
      strCurrentPhaseGreen := ''; //Ток зелёной фазы B, Амперы
      strCurrentPhaseRed := ''; //Ток красной фазы C, Амперы
      strTensionPhaseYellow := ''; //Напряжение жёлтой фазы A, Вольты
      strTensionPhaseGreen := ''; //Напряжение зелёной фазы B, Вольты
      strTensionPhaseRed := ''; //Напряжение красной фазы C, Вольты
      strPowerCoef := '0.92'; //Коэффициент мощности
      strMsg := ''; //Текст сообщения об удалении промежуточного замера

      //Выданные Технические Условия, без признака РЕАЛИЗОВАННОСТИ
      vChLstBxCtrl := TfrxCheckListBoxControl(
        frxRLoadS04Reserv.FindObject('chLstBxDlgPgTechTerms'));
      vChLstBxCtrlAfterGuaging := TfrxCheckListBoxControl(
        frxRLoadS04Reserv.FindObject('chLstBxDlgPgTechTermsAfterGuaging'));
      vChLstBxCtrl.Height := vChLstBxCtrlAfterGuaging.Top +
        vChLstBxCtrlAfterGuaging.Height - vChLstBxCtrl.Top;

      vChLstBxCtrl.Items.Clear;
      zqryLoadS04ReservTrPacks.Close;
      zqryLoadS04ReservTrPacks.DataSource := nil;
      zqryLoadS04ReservTrPacks.ParamByName('code_substation04').AsInteger :=
        DMReportsENetObject.codeS04; //Код Подстанции 10 - 6 / 0,4 кВ
        //zqryLoadS04ReservPack.FieldByName('code_substation04').AsInteger
      zqryLoadS04ReservTrPacks.ParamByName('code_transformer').AsInteger :=
        DMReportsENetObject.codeTr; //Код Трансформатора 10 - 6 / 0,4 кВ
        //zqryLoadS04ReservPack.FieldByName('code_transformer').AsInteger
      zqryLoadS04ReservTrPacks.Open;
      zqryLoadS04ReservTrPacks.First;
      SetLength(subSystemIdArray, zqryLoadS04ReservTrPacks.RecordCount);
      SetLength(packIdArray, zqryLoadS04ReservTrPacks.RecordCount);
      while not (zqryLoadS04ReservTrPacks.Eof) do
        begin
          m := zqryLoadS04ReservTrPacks.RecNo - 1;
          vChLstBxCtrl.Items.AddObject(
            zqryLoadS04ReservTrPacks.FieldByName('name').AsString
            + ' (' + zqryLoadS04ReservTrPacks.FieldByName('name_ss').AsString +
            ', пакет '
            + zqryLoadS04ReservTrPacks.FieldByName('id_pack').AsString + ')',
            TObject(m));
          vChLstBxCtrl.Checked[vChLstBxCtrl.Items.Count - 1] :=
            (zqryLoadS04ReservTrPacks.FieldByName('is_realized').AsInteger = 1);
          subSystemIdArray[m] :=
            zqryLoadS04ReservTrPacks.FieldByName('id_ss').AsInteger;
          packIdArray[m] :=
            zqryLoadS04ReservTrPacks.FieldByName('id_pack').AsInteger;
          zqryLoadS04ReservTrPacks.Next;
        end; //while not (zqryLoadS04ReservTrPacks.Eof) do
      zqryLoadS04ReservTrPacks.DataSource := dsLoadS04ReservTransformer;

      //Существующие Технические Условия, с признаком РЕАЛИЗОВАННОСТИ
      vChLstBxCtrlRealiz := TfrxCheckListBoxControl(
        frxRLoadS04Reserv.FindObject('chLstBxDlgPgTechTermsRealiz'));
      vChLstBxCtrlFinish := TfrxCheckListBoxControl(
        frxRLoadS04Reserv.FindObject('chLstBxDlgPgTechTermsFinish'));
      vChLstBxCtrlRealiz.Height := vChLstBxCtrlFinish.Top +
        vChLstBxCtrlFinish.Height - vChLstBxCtrlRealiz.Top;

      vChLstBxCtrlRealiz.Items.Clear;
      zqryLoadS04ReservTrPacksRealiz.Close;
      zqryLoadS04ReservTrPacksRealiz.DataSource := nil;
      zqryLoadS04ReservTrPacksRealiz.ParamByName('code_substation04').AsInteger
        := DMReportsENetObject.codeS04; //Код Подстанции 10 - 6 / 0,4 кВ
        //zqryLoadS04ReservPack.FieldByName('code_substation04').AsInteger;
      zqryLoadS04ReservTrPacksRealiz.ParamByName('code_transformer').AsInteger
        := DMReportsENetObject.codeTr; //Код Трансформатора 10 - 6 / 0,4 кВ
        //zqryLoadS04ReservPack.FieldByName('code_transformer').AsInteger;
      zqryLoadS04ReservTrPacksRealiz.Open;
      zqryLoadS04ReservTrPacksRealiz.First;
      SetLength(
        subSystemIdRealizArray, zqryLoadS04ReservTrPacksRealiz.RecordCount);
      SetLength(packIdRealizArray, zqryLoadS04ReservTrPacksRealiz.RecordCount);
      while not (zqryLoadS04ReservTrPacksRealiz.Eof) do
        begin
          m := zqryLoadS04ReservTrPacksRealiz.RecNo - 1;
          vChLstBxCtrlRealiz.Items.AddObject(
            zqryLoadS04ReservTrPacksRealiz.FieldByName('name').AsString
            + ' (' + zqryLoadS04ReservTrPacksRealiz.FieldByName(
            'name_ss').AsString + ', пакет ' +
            zqryLoadS04ReservTrPacksRealiz.FieldByName(
            'id_pack').AsString + ')', TObject(m));
          vChLstBxCtrlRealiz.Checked[vChLstBxCtrlRealiz.Items.Count - 1] :=
            (zqryLoadS04ReservTrPacksRealiz.FieldByName(
              'is_realized').AsInteger = 1);
          subSystemIdRealizArray[m] :=
            zqryLoadS04ReservTrPacksRealiz.FieldByName('id_ss').AsInteger;
          packIdRealizArray[m] :=
            zqryLoadS04ReservTrPacksRealiz.FieldByName('id_pack').AsInteger;
          zqryLoadS04ReservTrPacksRealiz.Next;
        end; //while not (zqryLoadS04ReservTrPacksRealiz.Eof) do
      zqryLoadS04ReservTrPacksRealiz.DataSource := dsLoadS04ReservTransformer;

      //TfrxEditControl(frxRLoadS04Reserv.FindObject('edtDlgPgImax')
      //  ).Text := FloatToStr(vImax);
      zqryLoadS04ReservENTrPowStr.Close;
      zqryLoadS04ReservENTrPowStr.ParamByName('code_substation04'
        ).AsInteger :=
        zqryLoadS04ReservPack.FieldByName('code_substation04').AsInteger;

      if DMReportsENetObject.codeTr > 0 then
        begin //http://10.77.11.28:8080/browse/SUPP-26144
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
            'transformercode').AsInteger := DMReportsENetObject.codeTr;
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'transformercode').AsInteger := DMReportsENetObject.codeTr;
        end //Названия целочисленного параметра КОД ТРАНСФОРМАТОРА запросов
      else //строкового zqryLoadS04ReservENTrPowStr.sql и агрегинованной выборки
        begin //zqryLoadS04ReservTrPacksAgreg.sql никак не может совпадать с
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName( //полем
            'transformercode').Clear; //запроса zqryLoadS04ReservPack.sql.
          DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
            'transformercode').Clear; //Иначе передача запросам значения
        end; //переменной DMReportsENetObject.codeTr утратит смысл - параметры
      //позже приобретут значение указанного поля благодаря источнику данных
      //dsLoadS04ReservPack. Поэтому не code_transformer, а transformercode.

      zqryLoadS04ReservENTrPowStr.Open;

      TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgNominalPower')
        ).Text :=
        zqryLoadS04ReservENTrPowStr.FieldByName('trpowers').AsString;
      if TfrxMemoView(frxRLoadS04Reserv.FindObject('memCalculaterPost')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgCalculaterPost')
          ).Text := strReservStationCalculaterPost
      else
        TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgCalculaterPost')
          ).Text := TfrxMemoView(frxRLoadS04Reserv.FindObject(
            'memCalculaterPost')).Memo.Text;

      if TfrxMemoView(frxRLoadS04Reserv.FindObject('memCalculater')
        ).Memo.Text = ''
      then //http://10.77.11.28:8080/browse/SUPP-21520; SUPP-23927
        begin
          if strReservStationCalculater = '' then
            TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgCalculater')
              ).Text := '' //CURRENT_USER_FIO
          else
            TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgCalculater')
              ).Text := strReservStationCalculater
        end
      else
        TfrxMemoControl(
          frxRLoadS04Reserv.FindObject('memDlgPgCalculater')).Text :=
        TfrxMemoView(frxRLoadS04Reserv.FindObject('memCalculater')).Memo.Text;

      if TfrxMemoView(frxRLoadS04Reserv.FindObject('memValidaterPost')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgValidaterPost')
          ).Text := strReservStationValidaterPost
      else
        TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgValidaterPost')
          ).Text := TfrxMemoView(frxRLoadS04Reserv.FindObject(
            'memValidaterPost')).Memo.Text;

      if TfrxMemoView(frxRLoadS04Reserv.FindObject('memValidater')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgValidater')
          ).Text := strReservStationValidater //CURRENT_USER_FIO
      else
        TfrxMemoControl(frxRLoadS04Reserv.FindObject('memDlgPgValidater')
          ).Text := TfrxMemoView(frxRLoadS04Reserv.FindObject('memValidater')
            ).Memo.Text;

      //Инициализация переменных для последующей передачи параметрами в запросы
      //промежуточных показателей нагрузки трансформатора 10 - 6 / 0,4 кВ
      DMReportsENetObject.vPowerCoef := 0.92; //Коэффициент мощности
      DMReportsENetObject.vDateGauge := MinDateTime; //Дата замера в промежуточной таблице
      DMReportsENetObject.vCurPhaseYellow := 0; //Ток жёлтой фазы A, Амперы
      DMReportsENetObject.vCurPhaseGreen := 0; //Ток зелёной фазы B, Амперы
      DMReportsENetObject.vCurPhaseRed := 0; //Ток красной фазы C, Амперы
      DMReportsENetObject.vTensPhaseYellow := 0; //Напряжение жёлтой фазы A, Вольты
      DMReportsENetObject.vTensPhaseGreen := 0; //Напряжение зелёной фазы B, Вольты
      DMReportsENetObject.vTensPhaseRed := 0; //Напряжение красной фазы C, Вольты

      //Вызов процедуры для изменения параметров показателей загрузки
      //Понижающих Трансформаторных Станций 10 - 6 / 0,4 кВ
      //из промежуточной таблиц комплекса WorkFlow в случае отсутствия
      //достоверных данных, совпадающих с протоколами режимных замеров,
      //в таблице комплекса EnergyNet и последующая их передача полям формы
      DMReportsENetObject.St04TransformerQuerySetParam(isExistENFiderGauge);
      if (DMReportsENetObject.vCurPhaseYellow <> 0)
      or (DMReportsENetObject.vCurPhaseGreen <> 0)
      or (DMReportsENetObject.vCurPhaseRed <> 0) then
        begin
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text := FloatToStr(
              DMReportsENetObject.vPowerCoef);
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgCurrentPhaseYellow')).Text := //Ток жёлтой фазы A, Амперы
              FloatToStr(DMReportsENetObject.vCurPhaseYellow);
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgCurrentPhaseGreen')).Text := //Ток зелёной фазы B, Амперы
              FloatToStr(DMReportsENetObject.vCurPhaseGreen);
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgCurrentPhaseRed')).Text := //Ток красной фазы C, Амперы
              FloatToStr(DMReportsENetObject.vCurPhaseRed);
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgTensionPhaseYellow')).Text := //Напряжение фазы A, Вольты
              FloatToStr(DMReportsENetObject.vTensPhaseYellow);
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgTensionPhaseGreen')).Text := //Напряжение фазы B, Вольты
              FloatToStr(DMReportsENetObject.vTensPhaseGreen);
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgTensionPhaseRed')).Text := //Напряжение фазы C, Вольты
              FloatToStr(DMReportsENetObject.vTensPhaseRed);
          TfrxDateEditControl(frxRLoadS04Reserv.FindObject( //Дата замера
            'dateEdtDlgPgGauging')).Date := DMReportsENetObject.vDateGauge;
        end //if (DMReportsENetObject.vCurPhaseYellow <> 0) ...
      else //Очистка полей диалоговой формы
        begin
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text := '0.92';
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgCurrentPhaseYellow')).Text := ''; //Ток фазы A, Амперы
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgCurrentPhaseGreen')).Text := ''; //Ток фазы B, Амперы
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgCurrentPhaseRed')).Text := ''; //Ток фазы C, Амперы
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgTensionPhaseYellow')).Text := ''; //Напряжение A, Вольты
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgTensionPhaseGreen')).Text := ''; //Напряжение B, Вольты
          TfrxEditControl(frxRLoadS04Reserv.FindObject(
            'edtDlgPgTensionPhaseRed')).Text := ''; //Напряжение фазы C, Вольты
          TfrxDateEditControl(frxRLoadS04Reserv.FindObject(
            'dateEdtDlgPgGauging')).Date := MinDateTime; //Дата замера
          TfrxDateEditControl(frxRLoadS04Reserv.FindObject( //Обнуление времени
            'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
        end; //else //Очистка полей диалоговой формы

      //Вызов диалоговой формы показателей загрузки подстанции 10 - 6 / 0,4 кВ
      TfrxDialogPage(frxRLoadS04Reserv.Pages[cntPgLoadS04Reserv + 1]).ShowModal;
      modRes := TfrxDialogPage(frxRLoadS04Reserv.Pages[cntPgLoadS04Reserv + 1]
        ).ModalResult;

      if (modRes = mrRetry) then
        begin
          //Передача параметров в запрос вызова серверной функции для удаления
          //записей таблицы Показателей уровней напряжения и силы тока на
          //клемах главных коммутационных аппаратов Трансформаторных
          //Подстанций 10 - 6 / 0,4 кВ, а также для удаления записей
          //таблиц связей указанной выше таблицы с пакетами документов
          //подсистем ПРИСОЕДИНЕНИЕ I - IV до и после 01.08.2010, c 14.03.2011,
          //c 01.03.2013 гг. и запуск запроса
          if codeS04 <= 0 then
            begin
              Application.MessageBox(
                PChar('Не указана Понижающая Станция 10 - 6 / 0,4 кВ.'),
                PChar('Внимание!'), MB_ICONWARNING);
              Exit;
            end;
          if codeTr <= 0 then
            begin
              Application.MessageBox(
                PChar('Не указан Трансформатор 10 - 6 / 0,4 кВ.'),
                PChar('Внимание!'), MB_ICONWARNING);
              Exit;
            end;

          zqryEditEWFFiderGauge.Close;
          zqryEditEWFFiderGauge.ParamByName('p_id_subsystem').Clear;
          zqryEditEWFFiderGauge.ParamByName('p_id_pack').Clear; //Код пакета
          zqryEditEWFFiderGauge.ParamByName('p_substation04code').AsInteger :=
            codeS04; //Код Трансформаторной Подстанции 10 - 6 / 0,4 кВ
          zqryEditEWFFiderGauge.ParamByName('p_transformercode').AsInteger :=
            codeTr; //Код Трансформатора 10 - 6 / 0,4 кВ

          TfrxDateEditControl(frxRLoadS04Reserv.FindObject( //Обнуление
            'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00'); //времени
          vDateGauge := TfrxDateEditControl( //Дата замера
            frxRLoadS04Reserv.FindObject('dateEdtDlgPgGauging')).Date;
          zqryEditEWFFiderGauge.ParamByName('p_dategauge').AsDate :=
            vDateGauge; //Дата замера

          zqryEditEWFFiderGauge.ParamByName('p_currentphaseyellow').Clear;
            //Сила тока жёлтой фазы A в промежуточной таблице, Амперы
          zqryEditEWFFiderGauge.ParamByName('p_tensionphaseyellow').Clear;
            //Напряжение жёлтой фазы A в промежуточной таблице, Вольты

          zqryEditEWFFiderGauge.ParamByName('p_currentphasegreen').Clear;
            //Сила тока зелёной фазы B в промежуточной таблице, Амперы
          zqryEditEWFFiderGauge.ParamByName('p_tensionphasegreen').Clear;
            //Напряжение зелёной фазы B в промежуточной таблице, Вольты

          zqryEditEWFFiderGauge.ParamByName('p_currentphasered').Clear;
            //Сила тока красной фазы C в промежуточной таблице, Амперы
          zqryEditEWFFiderGauge.ParamByName('p_tensionphasered').Clear;
            //Напряжение красной фазы C в промежуточной таблице, Вольты

          zqryEditEWFFiderGauge.ParamByName('p_userfio').Clear;
            //ФИО текущего пользователя
          zqryEditEWFFiderGauge.ParamByName('p_isdelgauge').AsBoolean := True;
            //Замер в промежуточной таблице удаляется, а не редактируется
          zqryEditEWFFiderGauge.Open;
          zqryEditEWFFiderGauge.First;
          strMsg := zqryEditEWFFiderGauge.FieldByName(
            'edit_ewffidergauge_result').AsString;
          Application.MessageBox(
            PChar(strMsg), PChar('Внимание!'), MB_ICONINFORMATION);

          DMReportsENetObject.vPowerCoef := 0.92; //Очистка коэффициента
          DMReportsENetObject.vDateGauge := MinDateTime;
            //Очистка параметра Дата замера в промежуточной таблице
          DMReportsENetObject.vCurPhaseYellow := 0;
            //Очистка параметра Ток жёлтой фазы A, Амперы
          DMReportsENetObject.vCurPhaseGreen := 0;
            //Очистка параметра Ток зелёной фазы B, Амперы
          DMReportsENetObject.vCurPhaseRed := 0;
            //Очистка параметра Ток красной фазы C, Амперы
          DMReportsENetObject.vTensPhaseYellow := 0;
            //Очистка параметра Напряжение жёлтой фазы A, Вольты
          DMReportsENetObject.vTensPhaseGreen := 0;
            //Очистка параметра Напряжение зелёной фазы B, Вольты
          DMReportsENetObject.vTensPhaseRed := 0;
            //Очистка параметра Напряжение красной фазы C, Вольты

          //Вызов процедуры передачи через параметры показателей загрузки
          //Понижающих Трансформаторных Станций 10 - 6 / 0,4 кВ
          //из промежуточной таблиц комплекса EnergyWorkFlow в случае
          //отсутствия данных, совпадающих с протоколами режимных замеров,
          //в таблице комплекса EnergyNet с возможностью изменения этих
          //параметров и сохранением их в промежуточную таблицу WorkFlow
          DMReportsENetObject.St04TransformerQuerySetParam(
            isExistENFiderGauge);

          //Очистка задающих параметры промежуточной таблицы полей диалога
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text := '0.92';
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Ток жёлтой фазы A,
            'edtDlgPgCurrentPhaseYellow')).Text := ''; //Амперы
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Ток зелёной фазы B,
            'edtDlgPgCurrentPhaseGreen')).Text := ''; //Амперы
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Ток красной фазы C,
            'edtDlgPgCurrentPhaseRed')).Text := ''; //Амперы
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Напряжение жёлтой
            'edtDlgPgTensionPhaseYellow')).Text := ''; //фазы A, Вольты
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Напряжение зелёной
            'edtDlgPgTensionPhaseGreen')).Text := ''; //фазы B, Вольты
          TfrxEditControl(frxRLoadS04Reserv.FindObject( //Напряжение красной
            'edtDlgPgTensionPhaseRed')).Text := ''; //фазы C, Вольты
        end; //if (modRes = mrRetry) then

      if (modRes = mrYes) then
        begin
          frmFiderGauge := TfrmFiderGauge.Create(Application, dsView);
          try
            frmFiderGauge.codeTransformer := DMReportsENetObject.codeTr;
            frmFiderGauge.actDelete.Enabled := False;
            frmFiderGauge.actReportFiderGauge.Enabled := False;
            frmFiderGauge.codeS04 := DMReportsENetObject.codeS04;
              //Код Трансформаторной Подстанции 10 - 6 / 0,4 кВ
            frmFiderGauge.nameS04 := DMReportsENetObject.vObjS04name;
              //Название Трансформаторной Подстанции 10 - 6 / 0,4 кВ
            if frmFiderGauge.ShowModal = mrOk then
              begin
                TfrxEditControl(frxRLoadS04Reserv.FindObject( //Ток жёлтой
                  'edtDlgPgCurrentPhaseYellow')).Text := //фазы А, Амперы
                    FloatToStr(FiderGauge.vCurrentPhaseYellow);
                TfrxEditControl(frxRLoadS04Reserv.FindObject( //Ток зелёной
                  'edtDlgPgCurrentPhaseGreen')).Text := //фазы B, Амперы
                    FloatToStr(FiderGauge.vCurrentPhaseGreen);
                TfrxEditControl(frxRLoadS04Reserv.FindObject( //Ток красной
                  'edtDlgPgCurrentPhaseRed')).Text := //фазы C, Амперы
                    FloatToStr(FiderGauge.vCurrentPhaseRed);

                TfrxEditControl(frxRLoadS04Reserv.FindObject( //Напряжение
                  'edtDlgPgTensionPhaseYellow')).Text := //жёлтой фазы А,
                    FloatToStr(FiderGauge.vTensionPhaseYellow); //Вольты
                TfrxEditControl(frxRLoadS04Reserv.FindObject( //Напряжение
                  'edtDlgPgTensionPhaseGreen')).Text := //зелёной фазы B,
                    FloatToStr(FiderGauge.vTensionPhaseGreen);  //Вольты
                TfrxEditControl(frxRLoadS04Reserv.FindObject( //Напряжение
                  'edtDlgPgTensionPhaseRed')).Text := //красной фазы C,
                    FloatToStr(FiderGauge.vTensionPhaseRed); //Вольты
                TfrxDateEditControl(frxRLoadS04Reserv.FindObject( //Дата замера
                  'dateEdtDlgPgGauging')).Date := FiderGauge.vFiderGaugeDate;
              end; //if frmFiderGauge.ShowModal = mrOk then
          except
            on EConvertError do Exit;
          end;
        end; //if (modRes = mrYes) then

      if (modRes = mrOk) or (modRes = mrRetry) or (modRes = mrYes) then
        begin
          for m := Low(packIdArray) to High(packIdArray) do
            begin //Заполнение признака РЕАЛИЗОВАННОСТИ для СУЩЕСТВУЮЩИХ ТУ
              with qryCntTechTerms do
                begin
                  Close;
                  ParamByName('id_pack').AsInteger := packIdArray[m];
                  ParamByName('id_ss').AsInteger := subSystemIdArray[m];
                  Open;
                  case subSystemIdArray[m] of
                    SS_CONNECTION:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsCN
                      else
                        qryTechTermsInsOrUpd := qryTTUpdCN;
                    SS_NEWCONNECTION:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsNCN
                      else
                        qryTechTermsInsOrUpd := qryTTUpdNCN;
                    SS_CONNECTION_20110314:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsCN20110314
                      else
                        qryTechTermsInsOrUpd := qryTTUpdCN20110314;
                    SS_ELECTRICINSTALLACCESSPOWER:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsEAP
                      else
                        qryTechTermsInsOrUpd := qryTTUpdEAP;
                  end; //case subSystemIdArray[m] of
                end; //with qryCntTechTerms do
              with qryTechTermsInsOrUpd do
                begin
                  if vChLstBxCtrl.Checked[m] then
                    ParamByName('is_realized').AsInteger := 1
                  else
                    ParamByName('is_realized').AsInteger := 0;
                  ParamByName('id_pack').AsInteger := packIdArray[m];
                  ExecSQL;
                end; //with qryTechTermsInsOrUpd do
            end; //for m := Low(packIdArray) to High(packIdArray) do

          for m := Low(packIdRealizArray) to High(packIdRealizArray) do
            begin //Очистка признака РЕАЛИЗОВАННОСТИ для СУЩЕСТВУЮЩИХ ТУ
              with qryCntTechTerms do
                begin
                  Close;
                  ParamByName('id_pack').AsInteger := packIdRealizArray[m];
                  ParamByName('id_ss').AsInteger := subSystemIdRealizArray[m];
                  Open;
                  case subSystemIdRealizArray[m] of
                    SS_CONNECTION:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsCN
                      else
                        qryTechTermsInsOrUpd := qryTTUpdCN;
                    SS_NEWCONNECTION:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsNCN
                      else
                        qryTechTermsInsOrUpd := qryTTUpdNCN;
                    SS_CONNECTION_20110314:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsCN20110314
                      else
                        qryTechTermsInsOrUpd := qryTTUpdCN20110314;
                    SS_ELECTRICINSTALLACCESSPOWER:
                      if FieldByName('cnt_techterms').AsInteger = 0 then
                        qryTechTermsInsOrUpd := qryTTInsEAP
                      else
                        qryTechTermsInsOrUpd := qryTTUpdEAP;
                  end; //case subSystemIdRealizArray[m] of
                end; //with qryCntTechTerms do
              with qryTechTermsInsOrUpd do
                begin
                  if vChLstBxCtrlRealiz.Checked[m] then
                    ParamByName('is_realized').AsInteger := 1
                  else
                    ParamByName('is_realized').AsInteger := 0;
                  ParamByName('id_pack').AsInteger := packIdRealizArray[m];
                  ExecSQL;
                end; //with qryTechTermsInsOrUpd do
            end; //for m := Low(packIdRealizArray)
                 //to High(packIdRealizArray) do

          TfrxMemoView(frxRLoadS04Reserv.FindObject('memCalculater')
            ).Memo.Text :=
            WideString(GetTextOfTfrxMemoControl('memDlgPgCalculater'));
          TfrxMemoView(frxRLoadS04Reserv.FindObject('memValidater')
            ).Memo.Text :=
            WideString(GetTextOfTfrxMemoControl('memDlgPgValidater'));

          TfrxMemoView(frxRLoadS04Reserv.FindObject('memCalculaterPost')
            ).Memo.Text :=
            WideString(GetTextOfTfrxMemoControl('memDlgPgCalculaterPost'));
          TfrxMemoView(frxRLoadS04Reserv.FindObject('memValidaterPost')
            ).Memo.Text :=
            WideString(GetTextOfTfrxMemoControl('memDlgPgValidaterPost'));

          //Передача значений показателей замеров из заполненных полей
          //диалоговой формы FastReport локальным переменным этого модуля
          if (modRes = mrOk) or (modRes = mrYes) then
            begin
              //Передача значений полей диалоговой формы строковым переменным
              strPowerCoef := TfrxEditControl( //Коэффициент мощности
                frxRLoadS04Reserv.FindObject('edtDlgPgPowerCoefficient')).Text;
              strCurrentPhaseYellow := TfrxEditControl(
                frxRLoadS04Reserv.FindObject('edtDlgPgCurrentPhaseYellow')
                ).Text; //Ток жёлтой фазы A в промежуточной таблице, Амперы
              strCurrentPhaseGreen := TfrxEditControl(
                frxRLoadS04Reserv.FindObject('edtDlgPgCurrentPhaseGreen')
                ).Text; //Ток зелёной фазы B в промежуточной таблице, Амперы
              strCurrentPhaseRed := TfrxEditControl(
                frxRLoadS04Reserv.FindObject('edtDlgPgCurrentPhaseRed')
                ).Text; //Ток красной фазы C в промежуточной таблице, Амперы
              strTensionPhaseYellow := TfrxEditControl(
                frxRLoadS04Reserv.FindObject('edtDlgPgTensionPhaseYellow')
                ).Text; //Напряжение жёлтой фазы A, Вольты
              strTensionPhaseGreen := TfrxEditControl(
                frxRLoadS04Reserv.FindObject('edtDlgPgTensionPhaseGreen')
                ).Text; //Напряжение зелёной фазы B, Вольты
              strTensionPhaseRed := TfrxEditControl(
                frxRLoadS04Reserv.FindObject('edtDlgPgTensionPhaseRed')
                ).Text; //Напряжение красной фазы C, Вольты

              if (strCurrentPhaseYellow <> '') or (strCurrentPhaseGreen <> '')
              or (strCurrentPhaseRed <> '') then
                begin //Предварительное обнуление времени
                  TfrxDateEditControl(frxRLoadS04Reserv.FindObject(
                    'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
                  vDateGauge := TfrxDateEditControl( //Дата замера
                    frxRLoadS04Reserv.FindObject('dateEdtDlgPgGauging')).Date;
                end;

              if strPowerCoef <> '' then
                vPowerCoef := StrToFloat(strPowerCoef); //Коэффициент мощности
              //Промежуточные показатели замеров трансформатора 10 - 6 / 0,4 кВ
              if strCurrentPhaseYellow <> '' then //Ток жёлтой фазы A, Амперы
                DMReportsENetObject.vCurPhaseYellow :=
                  StrToFloat(strCurrentPhaseYellow);
              if strCurrentPhaseGreen <> '' then  //Ток зелёной фазы B, Амперы
                DMReportsENetObject.vCurPhaseGreen :=
                  StrToFloat(strCurrentPhaseGreen);
              if strCurrentPhaseRed <> '' then //Ток красной фазы C, Амперы
                DMReportsENetObject.vCurPhaseRed :=
                  StrToFloat(strCurrentPhaseRed);
              if strTensionPhaseYellow <> '' then //Напряжение фазы A, Вольты
                DMReportsENetObject.vTensPhaseYellow :=
                  StrToFloat(strTensionPhaseYellow);
              if strTensionPhaseGreen <> '' then //Напряжение фазы B, Вольты
                DMReportsENetObject.vTensPhaseGreen :=
                  StrToFloat(strTensionPhaseGreen);
              if strTensionPhaseRed <> '' then  //Напряжение фазы C, Вольты
                DMReportsENetObject.vTensPhaseRed :=
                  StrToFloat(strTensionPhaseRed);
            end; //if (modRes = mrOk) or (modRes = mrYes) then

          DMReportsENetObject.zqryLoadS04ReservENTransformer.Close;
          DMReportsENetObject.zqryLoadS04ReservENTrPowStr.Close;

          if (DMReportsENetObject.vCurPhaseYellow > 0) //Если параметры
          or (DMReportsENetObject.vCurPhaseGreen > 0) //задавались
          or (DMReportsENetObject.vCurPhaseRed > 0) then
            begin
              DMReportsENetObject.zqryEditEWFFiderGauge.Close;
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                  'p_id_subsystem').AsInteger := //Код подсистемы ПРИСОЕДИНЕНИЕ
				DataModuleReportsENetObject.subsystemID;
                  
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_id_pack').AsInteger := DMReportsENetObject.packageID;
                  //Код пакета документов
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_substation04code').AsInteger := DMReportsENetObject.codeS04;
                  //Код Подстанции 10 - 6 / 0,4 кВ
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_transformercode').AsInteger := DMReportsENetObject.codeTr;
                  //Код Трансформатора

              if (DMReportsENetObject.vDateGauge <> MinDateTime)
              and (Pos('30.12.1899', DateToStr(vDateGauge)) = 0) then
                DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                  'p_dategauge').AsDate := DMReportsENetObject.vDateGauge;
                    //Дата замера

              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_currentphaseyellow').AsFloat :=
                DMReportsENetObject.vCurPhaseYellow;
                  //Сила тока жёлтой фазы A, Амперы
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_tensionphaseyellow').AsFloat :=
                DMReportsENetObject.vTensPhaseYellow;
                  //Напряжение жёлтой фазы A, Вольты

              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_currentphasegreen').AsFloat :=
                DMReportsENetObject.vCurPhaseGreen;
                  //Сила тока зелёной фазы B, Амперы
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_tensionphasegreen').AsFloat :=
                DMReportsENetObject.vTensPhaseGreen;
                  //Напряжение зелёной фазы B, Вольты

              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_currentphasered').AsFloat :=
                DMReportsENetObject.vCurPhaseRed;
                  //Сила тока красной фазы C, Амперы
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_tensionphasered').AsFloat :=
                DMReportsENetObject.vTensPhaseRed;
                  //Напряжение красной фазы C, Вольты

              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_userfio').AsString := ''; //CURRENT_USER_FIO
                  //ФИО текущего пользователя
              DMReportsENetObject.zqryEditEWFFiderGauge.ParamByName(
                'p_isdelgauge').AsBoolean := False;
                  //Замер промежуточной таблицы изменяется, а не удаляется
              DMReportsENetObject.zqryEditEWFFiderGauge.ExecSQL;

              //Передача параметров в выборку Трансформаторов 10 - 6 / 0,4 кВ,
              //задействованную в отчёте
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'tensionphaseyellow').AsFloat :=
                DMReportsENetObject.vTensPhaseYellow;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'currentphaseyellow').AsFloat :=
                DMReportsENetObject.vCurPhaseYellow;

              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'tensionphasegreen' ).AsFloat :=
                DMReportsENetObject.vTensPhaseGreen;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'currentphasegreen').AsFloat :=
                DMReportsENetObject.vCurPhaseGreen;

              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'tensionphasered' ).AsFloat :=
                DMReportsENetObject.vTensPhaseRed;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'currentphasered').AsFloat := DMReportsENetObject.vCurPhaseRed;

              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'powercoefficient').AsFloat := DMReportsENetObject.vPowerCoef;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'dateguage').AsDateTime := DMReportsENetObject.vDateGauge;

              //Передача параметров в строковую выборку Трансформаторов
              //10 - 6 / 0,4 кВ
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'dateguage').AsDateTime := DMReportsENetObject.vDateGauge;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'currentphaseyellow').AsFloat :=
                DMReportsENetObject.vCurPhaseYellow;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'currentphasegreen').AsFloat :=
                DMReportsENetObject.vCurPhaseGreen;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'currentphasered').AsFloat := DMReportsENetObject.vCurPhaseRed;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'powercoefficient').AsFloat := DMReportsENetObject.vPowerCoef;

              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'dateguage').AsDateTime := DMReportsENetObject.vDateGauge;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'currentphaseyellow').AsFloat :=
                DMReportsENetObject.vCurPhaseYellow;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'currentphasegreen').AsFloat :=
                DMReportsENetObject.vCurPhaseGreen;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'currentphasered').AsFloat := DMReportsENetObject.vCurPhaseRed;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'powercoefficient').AsFloat := DMReportsENetObject.vPowerCoef;

            end //if (DMReportsENetObject.vCurPhaseYellow > 0) ...
          else //Если параметры НЕ задавались
            begin //Очистка параметров задействованных в отчёте выборок
              //Очистка параметров выборки Трансформаторов 10 - 6 / 0,4 кВ
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'tensionphaseyellow').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'currentphaseyellow').Clear;

              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'tensionphasegreen').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'currentphasegreen').Clear;

              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'tensionphasered').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'currentphasered').Clear;

              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'powercoefficient').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTransformer.ParamByName(
                'dateguage').Clear;

              //Очистка параметров строковой выборки Трансформаторов
              //10 - 6 / 0,4 кВ
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'dateguage').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'currentphaseyellow').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'currentphasegreen').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'currentphasered').Clear;
              DMReportsENetObject.zqryLoadS04ReservENTrPowStr.ParamByName(
                'powercoefficient').Clear;

              //Очистка параметров агреггированной выборки Трансформаторов
              //10 - 6 / 0,4 кВ
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'dateguage').Clear;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'currentphaseyellow').Clear;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'currentphasegreen').Clear;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'currentphasered').Clear;
              DMReportsENetObject.zqryLoadS04ReservTrPacksAgreg.ParamByName(
                'powercoefficient').Clear;
            end; //else //Если параметры НЕ задавались

          if not ((modRes = mrRetry) //Если не было неудачной попытки удаления
            and (Pos('НЕ СУЩЕСТВУЕТ замера', strMsg) <> 0)) //режимного замера
          and not (modRes = mrCancel)
          then //из промежуточной таблицы комплекса EnergyWorkFlow
            frxRLoadS04Reserv.ShowReport();
        end;
    end; //if (Sender.Name = 'PictureLightning') then
end; //TDMReportsENetObject.frxRLoadS04ReservClickObject(...

procedure TDMReportsENetObject.frxRLoadS04ReservClosePreview(Sender: TObject);
var strTemp, strFileName: String;
begin
  if Application.MessageBox(//Сохранение отчёта во вложениях
    PChar('Зберігти Резерв потужності во вкладеннях?'), PChar('Увага!'),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES
  then
    begin
      frxPDFExport1.DefaultPath := 'Temp\';

      strTemp :=
        ExtractFilePath(Application.ExeName) + frxPDFExport1.DefaultPath;

      if not DirectoryExists(strTemp) then //проверка существавания паки
        CreateDir(strTemp); //и создание при необходимости
      frxPDFExport1.DefaultPath := strTemp;

      case DataModuleReportsENetObject.subsystemID of
        SS_CONNECTION:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS04ReservPackCN.FieldByName(
              's04name').AsString;
        SS_NEWCONNECTION:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS04ReservPackNCN.FieldByName(
              's04name').AsString;
        SS_CONNECTION_20110314:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS04ReservPackCN20110314.FieldByName(
              's04name').AsString;
        SS_ELECTRICINSTALLACCESSPOWER:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS04ReservPack.FieldByName(
              's04name').AsString;
      end;

      //SUPP-12460. Замена одинарных и двойных кавычек, точек, пробелов, левых
      //и правых слэшев, а также некорректно сохранённых символов в названии
      //файла на нижние подчёркивания
      strFileName := frxPDFExport1.FileName;
      strFileName := ReplaceInvalidChar(strFileName);
      if (Pos('''', strFileName) > 0) or (Pos('.', strFileName) > 0)
      or (Pos(' ', strFileName) > 0) then
        begin
          strFileName := AutoChange(strFileName, '''', '_');
          strFileName := AutoChange(strFileName, '.', '_');
          strFileName := AutoChange(strFileName, ' ', '_');
          strFileName := AutoChange(strFileName, '\', '_');
          strFileName := AutoChange(strFileName, '/', '_');
          strFileName := AutoChange(strFileName, '"', '_');
          strFileName := strFileName + '.pdf';
          frxPDFExport1.FileName := strFileName;
        end;

      //Экспорт в формате *.pdf и последующее сохранение
      frxRLoadS04Reserv.Export(frxPDFExport1);

      {frmInsertDocEWF := TfrmInsertDocEWF.Create(Application, dsInsert);
      if not Assigned(DMReportsEWF) then
	      Application.CreateForm(TDMReportsEWF, DMReportsEWF);
      try
        frmInsertDocEWF.spbDocPath.Visible := False;
        frmInsertDocEWF.id_ss := DataModuleReportsENetObject.subsystemID;
        frmInsertDocEWF.id_pack := DMReportsENetObject.packageID;
        frmInsertDocEWF.id_movement := DMReportsENetObject.movementID;
        frmInsertDocEWF.id_state := DMReportsENetObject.stateID;
        frmInsertDocEWF.odDoc.InitialDir := strTemp;
        frmInsertDocEWF.edtDocPath.Text := frxPDFExport1.FileName;
        frmInsertDocEWF.id_doctype :=
          CN_DOCTYPE_RESERV_STATION_VOLTAGE_LOW_10_6_04;
        case subsystemID of
          SS_CONNECTION: //ПРИСОЕДИНЕНИЕ I
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesCN, //Типы документов ПРИСОЕДИНЕНИЕ I до 01.08.2010 г.
                DMConnection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_DocTypesCN); //Типы документов ПРИСОЕДИНЕНИЕ I до 01.08.2010 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentCN, //Добавление вложения CN-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_InsertDocAttachmentCN, //Добавление вложения CN-пакета
                DMConnection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentCN, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_InsertLinkDocAttachmentCN, //Добавление ссылки к вложению
                DMConnection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes := DMConnection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMConnection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMConnection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMConnection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoadS04ReservPackCN.FieldByName(
                  's04name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMConnection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_CONNECTION: //ПРИСОЕДИНЕНИЕ I
          SS_NEWCONNECTION: //ПРИСОЕДИНЕНИЕ II
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesNCN, //Типы документов ПРИСОЕДИНЕНИЕ II с 01.08.2010 г.
                DMNewConnection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_DocTypesNCN); //Типы документов ПРИСОЕДИНЕНИЕ II с 01.08.2010 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentNCN, //Добавление вложения NCN-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_InsertDocAttachmentNCN, //Добавление вложения NCN-пакета
                DMNewConnection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentNCN, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_InsertLinkDocAttachmentNCN, //Добавление ссылки к вложению
                DMNewConnection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes := DMNewConnection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMNewConnection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMNewConnection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMNewConnection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoadS04ReservPackNCN.FieldByName(
                  's04name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMNewConnection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_NEWCONNECTION: //ПРИСОЕДИНЕНИЕ II
          SS_CONNECTION_20110314: //ПРИСОЕДИНЕНИЕ III
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesCN_20110314, //Типы документов ПРИСОЕДИНЕНИЕ III с 14.03.2011 г.
                DMCN20110314Connection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesCN20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_DocTypesCN_20110314); //Типы документов ПРИСОЕДИНЕНИЕ III с 14.03.2011 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentCN_20110314, //Добавление CN20110314-вложения
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentCN_20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_InsertDocAttachmentCN20110314, //Добавление вложения CN20110314-пакета
                DMCN20110314Connection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentCN20110314, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentCN20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_InsertLinkDocAttachmentCN20110314, //Добавление ссылки к вложению
                DMCN20110314Connection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes :=
                DMCN20110314Connection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMCN20110314Connection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMCN20110314Connection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMCN20110314Connection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoadS04ReservPackCN20110314.FieldByName(
                  's04name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMCN20110314Connection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_CONNECTION_20110314: //ПРИСОЕДИНЕНИЕ III
          SS_ELECTRICINSTALLACCESSPOWER: //ПРИСОЕДИНЕНИЕ IV
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesEAP, //Типы документов ПРИСОЕДИНЕНИЕ IV с 01.03.2013 г.
                DMEAPElectricInstallAccessPower.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_DocTypesEAP); //Типы документов ПРИСОЕДИНЕНИЕ IV с 01.03.2013 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentEAP, //Добавление вложения EAP-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_InsertDocAttachmentEAP, //Добавление вложения EAP-пакета
                DMEAPElectricInstallAccessPower.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentEAP, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_InsertLinkDocAttachmentEAP, //Добавление ссылки к вложению
                DMEAPElectricInstallAccessPower.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes :=
                DMEAPElectricInstallAccessPower.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMEAPElectricInstallAccessPower.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMEAPElectricInstallAccessPower.zspInsertLinkDocAttachment;
              //frmInsertDocEWF.qryAttachedDocs :=
              //  DMEAPElectricInstallAccessPower.qryAttachedDocs;
              frmInsertDocEWF.qryAttachedDocs :=
                DMEAPElectricInstallAccessPower.qryAttachedDocsVersions;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoadS04ReservPack.FieldByName(
                  's04name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMEAPElectricInstallAccessPower do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_ELECTRICINSTALLACCESSPOWER: //ПРИСОЕДИНЕНИЕ IV
        end; //case subsystemID of
      finally
        frmInsertDocEWF.Free;
        DMReportsEWF.Free;
        DMReportsEWF := nil;
      end;}
    end; //if Application.MessageBox(//Сохранение отчёта во вложениях ...

  DMReportsENetObject.hLoadS04Reserv := 0; //Высвобождение отчёта из памяти
  //Уменьшение на единицу количества открытых отчётов из модуля невизуальных
  Dec(LoadReportENetObjectCount); //компонентов взаимодействия с EnergyNet
  //Если не открыто ни одного взаимодействующего с EnergyNet
  if LoadReportENetObjectCount = 0 then //отчёта из DataModuleReportsENObject
    begin //Выгрузка содержащего отчёты взаимодействия с EnergyNet
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free; //модуля невизуальных компонентов
      DMReportsENetObject := nil;
    end; //if LoadReportENetObjectCount = 0 then ...
end;

//Процедура передачи через параметры показателей загрузки понижающих
//Трансформаторных Станций 150 / 35 - 27 кВ
//из промежуточной таблиц комплекса EnergyWorkFlow в случае отсутствия
//достоверных данных, совпадающих с протоколами режимных замеров,
//в таблице комплекса EnergyNet с возможностью редактирования этих
//параметров и сохранением их в промежуточную таблицу EnergyWorkFlow.
//Применяется для формирования загружаемых извне отчёт о Резерве
//Трансформаторной Станции, такой как frxRLoadS35Reserv
procedure TDMReportsENetObject.St150TransformerQuerySetParam(
  changeOnlyDMVar: Boolean = False); //изменять только переменные модуля
begin
  //Инициализация параметров происходит перед вызовом процедуры
  //DMReportsENetObject.vGaugeTension := 0; //Напряжение, кВ
  //DMReportsENetObject.vGaugeCurrent := 0; //Силы Тока, А
  //DMReportsENetObject.vDateGauge := MinDateTime; //Дата замера
  //DMReportsENetObject.vPowerCoef := 0.92; //Коэффициент мощности

  //Присвоение параметров
  DMReportsENetObject.zqryEWFGauge150.Close;
  DMReportsENetObject.zqryEWFGauge150.ParamByName(
    'substation150refcode').AsInteger :=
      DMReportsENetObject.codeS150;
  DMReportsENetObject.zqryEWFGauge150.ParamByName(
    'powertransrefcode').AsInteger :=
      DMReportsENetObject.codeSubst150PowerTrans;
  DMReportsENetObject.zqryEWFGauge150.Open;
  if DMReportsENetObject.zqryEWFGauge150.RecordCount > 0 then
    begin //Передача в параметры показателей промежуточной таблицы
      DMReportsENetObject.zqryEWFGauge150.First;
      DMReportsENetObject.vGaugeTension := //Напряжение, кВ
        DMReportsENetObject.zqryEWFGauge150.FieldByName('tension').AsFloat;
      DMReportsENetObject.vGaugeCurrent := //Силы Тока, А
        DMReportsENetObject.zqryEWFGauge150.FieldByName('current').AsFloat;
      //DMReportsENetObject.vPowerCoef := 0; //Коэффициент мощности
      DMReportsENetObject.vDateGauge :=
        DMReportsENetObject.zqryEWFGauge150.FieldByName(
          'dategauge').AsDateTime; //Дата замера
    end; //if DMReportsENetObject.zqryEWFGauge150.RecordCount...

  if not changeOnlyDMVar then //явно не указано менять только переменные
    begin
      //Передача параметров запросу списка
      //Силовых Трансформаторов 150 / 35 - 27 кВ
      DMReportsENetObject.zqryLoadS150ReservENPowTrans.Close;
      if (vDateGauge = MinDateTime) or (DateToStr(vDateGauge) = '30.12.1899')
      then
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'dategauge').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'dategauge').AsDateTime :=
            DMReportsENetObject.vDateGauge;
      if DMReportsENetObject.vGaugeTension = 0 then
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'gaugetension').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'gaugetension').AsFloat :=
            DMReportsENetObject.vGaugeTension;
      if DMReportsENetObject.vGaugeCurrent = 0 then
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'gaugecurrent').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'gaugecurrent').AsFloat :=
            DMReportsENetObject.vGaugeCurrent;
      if DMReportsENetObject.codeS150 = 0 then
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'code_ss150').Clear
      else //Код Станции 150 / 35 - 27 кВ
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
          'code_ss150').AsInteger :=  DMReportsENetObject.codeS150;

      //if DMReportsENetObject.codeSubst150PowerTrans = 0 then
      //  DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
      //    'code_st150powertrans').Clear
      //else //Код Трансформатора 150 / 35 - 27 кВ
      //  DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
      //    'code_st150powertrans').AsInteger :=
      //      DMReportsENetObject.codeSubst150PowerTrans;


      //Передача параметров запросу строчной информации о
      //Силовых Трансформаторах 150 / 35 - 27 кВ
      DMReportsENetObject.zqryLoadS150ReservENPowTransStr.Close;
      if (vDateGauge = MinDateTime) or (DateToStr(vDateGauge) = '30.12.1899')
      then
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'dategauge').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'dategauge').AsDateTime :=
            DMReportsENetObject.vDateGauge;
      if DMReportsENetObject.vGaugeTension = 0 then
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
        'gaugetension').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'gaugetension').AsFloat :=
            DMReportsENetObject.vGaugeTension;
      if DMReportsENetObject.vGaugeCurrent = 0 then
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'gaugecurrent').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'gaugecurrent').AsFloat :=
            DMReportsENetObject.vGaugeCurrent;
      if DMReportsENetObject.codeSubst150PowerTrans = 0 then
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'code_st150powertrans').Clear
      else //Код Трансформатора 150 / 35 - 27 кВ
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'code_st150powertrans').AsInteger :=
            DMReportsENetObject.codeSubst150PowerTrans;

      //Передача параметров запросу агреггированных значений загрузки
      //Силовых Трансформаторов 150 / 35 - 27 кВ
      DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.Close;
      if DMReportsENetObject.vGaugeTension = 0 then
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'gaugetension').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'gaugetension').AsFloat := DMReportsENetObject.vGaugeTension;
      if DMReportsENetObject.vGaugeCurrent = 0 then
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'gaugecurrent').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'gaugecurrent').AsFloat := DMReportsENetObject.vGaugeCurrent;
      if DMReportsENetObject.vPowerCoef = 0 then
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'powercoefficient').Clear
      else
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'powercoefficient').AsFloat := DMReportsENetObject.vPowerCoef;
      if DMReportsENetObject.codeSubst150PowerTrans = 0 then
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'code_st150powertrans').Clear
      else //Код Трансформатора 150 / 35 - 27 кВ
        DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.ParamByName(
          'code_st150powertrans').AsInteger :=
            DMReportsENetObject.codeSubst150PowerTrans;

      //DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.Open;
      //DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.First;
    end; //if not changeOnlyDMVar then
end; //procedure TDMReportsENetObject.St150TransformerQuerySetParam

procedure TDMReportsENetObject.frxRLoadS150ReservClickObject(Sender: TfrxView;
  Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
//Label Lbl_DlgPgShowBefore; //Метка перед вызовом диалоговой формы FastReport
var m, subst150PowerTransIdx: Integer;
  //vChLstBxCtrlPurpose, vChLstBxCtrlPurposeRealiz,
  vChLstBxCtrl, vChLstBxCtrlRealiz,
  vChLstBxCtrlAfterGuaging, vChLstBxCtrlFinish: TfrxCheckListBoxControl;
  vCmbBxCtrl: TfrxComboBoxControl;
  //subSystemIdPurposeArray, packIdPurposeArray,
  //subSystemIdPurposeRealizArray, packIdPurposeRealizArray,
  //subSystemIdAfterGuagingArray, packIdAfterGuagingArray,
  //subSystemIdFinishArray, packIdFinishArray,
  subSystemIdArray, packIdArray,
  subSystemIdRealizArray, packIdRealizArray: array of Integer;
  qryTechTermsInsOrUpd: TZQuery;
  modRes: TModalResult;
  //Промежуточные показатели замеров трансформатора 150 / 35 - 27 кВ
  strGaugeTension, //Показатель Напряжения в промежуточной таблице, кВ
  strGaugeCurrent, //Показатель Силы Тока в промежуточной таблице, А
  strPowerCoef, //Коэффициент мощности
  strMsg: String; //Текст сообщения об удалении промежуточного замера

  function GetTextOfTfrxMemoControl(mCtrlName: String): String;
  var i, m: Integer; s, f: String; vMC: TfrxMemoControl;
  begin
    vMC := TfrxMemoControl(frxRLoadS150Reserv.FindObject(mCtrlName));
    s := '';
    for i := 0 to vMC.Lines.Count - 1 do
      s := s + vMC.Lines[i];
    Result := s;
  end; //function GetTextOfTfrxMemoControl(mCtrlName: String): String;
begin
  if Button <> mbLeft then
    Exit;
  if (Sender.Name = 'PictureLightning') then
    begin
      //Инициализация строковых переменных для предотвращения неправильной
      //передачи значения полей диалоговой формы FastReport показателям
      //промежуточных замеров трансформатора 150 / 35 - 27 кВ
      strGaugeTension := ''; //Напряжение в промежуточной таблице, кВ
      strGaugeCurrent := ''; //Показатель Силы Тока в промежуточной таблице, А
      strPowerCoef := '0.92'; //Коэффициент мощности
      strMsg := ''; //Текст сообщения об удалении промежуточного замера, а
        //также выводимая в список Силовых Трансформаторов строка

      //Выданные Технические Условия, БЕЗ признака РЕАЛИЗОВАННОСТИ
      vChLstBxCtrl := TfrxCheckListBoxControl(
        frxRLoadS150Reserv.FindObject('chLstBxDlgPgTechTerms'));
      vChLstBxCtrlAfterGuaging := TfrxCheckListBoxControl(
        frxRLoadS150Reserv.FindObject('chLstBxDlgPgTechTermsAfterGuaging'));
      vChLstBxCtrl.Height := vChLstBxCtrlAfterGuaging.Top +
        vChLstBxCtrlAfterGuaging.Height - vChLstBxCtrl.Top;

      vChLstBxCtrl.Items.Clear;
      DMReportsENetObject.zqryLoadS150ReservTrPacks.Close;
      DMReportsENetObject.zqryLoadS150ReservTrPacks.DataSource := nil;

      DMReportsENetObject.zqryLoadS150ReservTrPacks.ParamByName( //Код Станции
        'code_ss150').AsInteger := DMReportsENetObject.codeS150;
      DMReportsENetObject.zqryLoadS150ReservTrPacks.ParamByName(
        'code_st150powertrans').AsInteger := //Код Силового Трансформатора
          DMReportsENetObject.codeSubst150PowerTrans; //150 / 35 - 27 кВ
      DMReportsENetObject.zqryLoadS150ReservTrPacks.ParamByName('id_subsystem'
        ).AsInteger := DataModuleReportsENetObject.subsystemID;
      DMReportsENetObject.zqryLoadS150ReservTrPacks.ParamByName('id_pack'
        ).AsInteger := DMReportsENetObject.packageID;
      DMReportsENetObject.zqryLoadS150ReservTrPacks.Open;
      DMReportsENetObject.zqryLoadS150ReservTrPacks.First;
      SetLength(subSystemIdArray, zqryLoadS150ReservTrPacks.RecordCount);
      SetLength(packIdArray, zqryLoadS150ReservTrPacks.RecordCount);
      while not (DMReportsENetObject.zqryLoadS150ReservTrPacks.Eof) do
        begin
          m := zqryLoadS150ReservTrPacks.RecNo - 1;
          vChLstBxCtrl.Items.AddObject(
            DMReportsENetObject.zqryLoadS150ReservTrPacks.FieldByName(
                'name').AsString + ' (' +
              DMReportsENetObject.zqryLoadS150ReservTrPacks.FieldByName(
                'name_ss').AsString + ', пакет ' +
              DMReportsENetObject.zqryLoadS150ReservTrPacks.FieldByName(
                'id_pack').AsString + ')',
            TObject(m));
          vChLstBxCtrl.Checked[vChLstBxCtrl.Items.Count - 1] :=
            (DMReportsENetObject.zqryLoadS150ReservTrPacks.FieldByName(
              'is_realized').AsInteger = 1);
          subSystemIdArray[m] :=
            DMReportsENetObject.zqryLoadS150ReservTrPacks.FieldByName(
              'id_ss').AsInteger;
          packIdArray[m] :=
            DMReportsENetObject.zqryLoadS150ReservTrPacks.FieldByName(
              'id_pack').AsInteger;
          DMReportsENetObject.zqryLoadS150ReservTrPacks.Next;
        end; //while not (DMReportsENetObject.zqryLoadS150ReservTrPacks.Eof) do
      DMReportsENetObject.zqryLoadS150ReservTrPacks.DataSource :=
        DMReportsENetObject.dsLoadS150ReservENPowTrans;

      //Существующие Технические Условия, С признаком РЕАЛИЗОВАННОСТИ
      vChLstBxCtrlRealiz := TfrxCheckListBoxControl(
        frxRLoadS150Reserv.FindObject('chLstBxDlgPgTechTermsRealiz'));
      vChLstBxCtrlFinish := TfrxCheckListBoxControl(
        frxRLoadS150Reserv.FindObject('chLstBxDlgPgTechTermsFinish'));
      vChLstBxCtrlRealiz.Height := vChLstBxCtrlFinish.Top +
        vChLstBxCtrlFinish.Height - vChLstBxCtrlRealiz.Top;

      vChLstBxCtrlRealiz.Items.Clear;
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.Close;
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.DataSource := nil;
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.ParamByName( //Станция
          'code_ss150').AsInteger := DMReportsENetObject.codeS150;
      //DMReportsENetObject.zqryLoadS150ReservPackEAP.FieldByName(
      //  'code_ss150').AsInteger;
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.ParamByName(
          'code_st150powertrans').AsInteger := //Код Силового Трансформатора
        DMReportsENetObject.codeSubst150PowerTrans; //150 / 35 - 27 кВ
      //DMReportsENetObject.zqryLoadS150ReservPackEAP.FieldByName(
      //  'code_st150powertrans').AsInteger;
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.Open;
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.First;
      SetLength(subSystemIdRealizArray,
        DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.RecordCount);
      SetLength(packIdRealizArray,
        DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.RecordCount);
      while not (DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.Eof) do
        begin
          m := DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.RecNo - 1;
          vChLstBxCtrlRealiz.Items.AddObject(
            DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.FieldByName(
              'name').AsString + ' (' +
            DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.FieldByName(
              'name_ss').AsString + ', пакет ' +
            DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.FieldByName(
            'id_pack').AsString + ')', TObject(m));
          vChLstBxCtrlRealiz.Checked[vChLstBxCtrlRealiz.Items.Count - 1] :=
            (DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.FieldByName(
              'is_realized').AsInteger = 1);
          subSystemIdRealizArray[m] :=
            DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.FieldByName(
              'id_ss').AsInteger;
          packIdRealizArray[m] :=
            DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.FieldByName(
              'id_pack').AsInteger;
          DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.Next;
        end; //while not (DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz...
      DMReportsENetObject.zqryLoadS150ReservTrPacksRealiz.DataSource :=
        DMReportsENetObject.dsLoadS150ReservENPowTrans;

      //Вызов процедуры для извлечения в переменные показателей загрузки
      //Понижающих Трансформаторных Станций 150 / 35 - 27 кВ
      //из промежуточной таблиц комплекса WorkFlow в случае отсутствия
      //достоверных совпадающих с протоколами режимных замеров данных в таблице
      //комплекса EnergyNet с последующей передача переменных полям формы
      //и параметров запросов загрузки
      DMReportsENetObject.St150TransformerQuerySetParam;

      //Строчная информация о Силовых Трансформаторах 150 / 35 - 27 кВ
      //zqryLoadS35ReservENPowTransStr.Close;
      DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
          'code_ss150').AsInteger :=
        DMReportsENetObject.zqryLoadS150ReservPackEAP.FieldByName(
          'code_ss150').AsInteger;
      DMReportsENetObject.zqryLoadS150ReservENPowTransStr.Open;

      TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgNominalPower')
          ).Text :=
        DMReportsENetObject.zqryLoadS150ReservENPowTransStr.FieldByName(
          'trpowers').AsString;

      //Список Силовых Трансформаторов 150 / 35 - 27 кВ
      DMReportsENetObject.zqryLoadS150ReservENPowTrans.Open;
      DMReportsENetObject.zqryLoadS150ReservENPowTrans.First;
      subst150PowerTransIdx := -1; //Инициализация индекса списка
      vCmbBxCtrl := TfrxComboBoxControl(frxRLoadS150Reserv.FindObject(
        'cmbBxDlpPgENSubst150PowerTrans'));
      vCmbBxCtrl.Items.Clear; //vCmbBxCtrl.Clear;
      SetLength(subst150PowerTransCodes,
        DMReportsENetObject.zqryLoadS150ReservENPowTrans.RecordCount);
      while not DMReportsENetObject.zqryLoadS150ReservENPowTrans.Eof do
        begin
          m := DMReportsENetObject.zqryLoadS150ReservENPowTrans.RecNo - 1;
          subst150PowerTransCodes[m] :=
            DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
              'code_st150powertrans').AsInteger;
          if subst150PowerTransCodes[m] > 0 then
            begin
              strMsg :=
                DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
                  'matname').AsString;
              if strMsg <> 'ТУ, залежні від Підстанції 150 / 35 - 27 кВ ' +
                'без вказівки трансформатору'
              then
                strMsg :=
                  DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
                    'trnumber').AsString + ' - ' + strMsg + ' (код EnergyNet '
                    + IntToStr(subst150PowerTransCodes[m]) + ')'
              else
                strMsg :=
                  DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
                    'trnumber').AsString;
              vCmbBxCtrl.Items.AddObject(strMsg, TObject(m));
              if subst150PowerTransCodes[m] =
                DMReportsENetObject.codeSubst150PowerTrans
              then
                subst150PowerTransIdx := m;
            end; //if subst150PowerTransCodes[m] > 0 then
          DMReportsENetObject.zqryLoadS150ReservENPowTrans.Next;
        end; //while not DMReportsENetObject.zqryLoadS150ReservENPowTrans.Eof do
      if subst150PowerTransIdx <> -1 then
        vCmbBxCtrl.ItemIndex := subst150PowerTransIdx;

      //Агреггированные значения загрузки Трансформаторов 150 / 35 - 27 кВ
      DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.Open;
      DMReportsENetObject.zqryLoadS150ReservTrPacksAgreg.First;


      //Заполнение полей диалоговой формы FastReport
      if DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
        'gaugetension').IsNull
      then
        TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgGaugeTension')
            ).Text :=
          DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
            'pointtransgaugetension').AsString
      else
        TfrxEditControl(
          frxRLoadS150Reserv.FindObject('edtDlgPgGaugeTension')).Text :=
            DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
              'gaugetension').AsString;

      if DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
        'gaugecurrent').IsNull then
        TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgImax')).Text :=
          DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
            'pointtransgaugecurrent').AsString
      else
        TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgImax')).Text :=
          DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
            'gaugecurrent').AsString;

      if DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
        'powercoefficient').IsNull
      then
        TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgPowerCoefficient'
          )).Text :=
            DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
              'powercoefficient').AsString
      else
        TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgPowerCoefficient'
          )).Text :=
            DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
              'powercoefficient').AsString;

      if DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
        'dategauge').IsNull
      then
        begin
          if DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
            'dategauge').IsNull
          then
            TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
              'dateEdtDlgPgGauging')).Date := Date
          else
            TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
              'dateEdtDlgPgGauging')).Date :=
                DMReportsENetObject.zqryLoadS150ReservENPowTrans.FieldByName(
                  'dategauge').AsDateTime;
        end
      else
        TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
          'dateEdtDlgPgGauging')).Date :=
            DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
              'dategauge').AsDateTime;

      if TfrxMemoView(frxRLoadS150Reserv.FindObject('memCalculaterPost')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgCalculaterPost')
          ).Text := strReservStationCalculaterPost
      else
        TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgCalculaterPost')
          ).Text := TfrxMemoView(frxRLoadS150Reserv.FindObject(
            'memCalculaterPost')).Memo.Text;

      if TfrxMemoView(frxRLoadS150Reserv.FindObject('memCalculater')
        ).Memo.Text = ''
      then //http://10.77.11.28:8080/browse/SUPP-21520; SUPP-23927
        begin
          if strReservStationCalculater = '' then
            TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgCalculater')
              ).Text := '' //CURRENT_USER_FIO
          else
            TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgCalculater')
              ).Text := strReservStationCalculater
        end
      else
        TfrxMemoControl(
          frxRLoadS150Reserv.FindObject('memDlgPgCalculater')).Text :=
        TfrxMemoView(frxRLoadS150Reserv.FindObject('memCalculater')).Memo.Text;

      if TfrxMemoView(frxRLoadS150Reserv.FindObject('memValidaterPost')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgValidaterPost')
          ).Text := strReservStationValidaterPost
      else
        TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgValidaterPost')
          ).Text := TfrxMemoView(frxRLoadS150Reserv.FindObject(
            'memValidaterPost')).Memo.Text;

      if TfrxMemoView(frxRLoadS150Reserv.FindObject('memValidater')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS150Reserv.FindObject('memDlgPgValidater')
          ).Text := strReservStationValidater
      else
        TfrxMemoControl(
          frxRLoadS150Reserv.FindObject('memDlgPgValidater')).Text :=
        TfrxMemoView(frxRLoadS150Reserv.FindObject('memValidater')).Memo.Text;

      if (DMReportsENetObject.vGaugeCurrent <> 0) then
        begin
          TfrxEditControl(frxRLoadS150Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text :=
              FloatToStr(DMReportsENetObject.vPowerCoef);
          TfrxDateEditControl(frxRLoadS150Reserv.FindObject( //Дата замера
            'dateEdtDlgPgGauging')).Date := DMReportsENetObject.vDateGauge;
          TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgImax')
            ).Text := //Ток, Амперы
            FloatToStr(DMReportsENetObject.vGaugeCurrent);
          TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgGaugeTension')
            ).Text := //Напряжение, килоВольты
            FloatToStr(DMReportsENetObject.vGaugeTension);
        end //if (vGaugeCurrent <> 0) then
      else //Очистка полей диалоговой формы
        begin
          TfrxEditControl(frxRLoadS150Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text := '0.92';
          TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
            'dateEdtDlgPgGauging')).Date := MinDateTime; //Дата замера
          TfrxDateEditControl(frxRLoadS150Reserv.FindObject( //Обнуление времени
            'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
          TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgImax')
            ).Text := ''; //Ток, Амперы
          TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgGaugeTension')
            ).Text := ''; //Напряжение, килоВольты
        end; //else //Очистка полей диалоговой формы

      //Lbl_DlgPgShowBefore: //Метка перед вызовом диалоговой формы FastReport
      modRes := Low(Integer); //Инициализация результирующей переменной диалога
      while not ((modRes = mrOk) or (modRes = mrCancel)) do
        begin
          //Вызов диалога для указания загрузки станции 150 / 35 - 27 кВ
          TfrxDialogPage(
            frxRLoadS150Reserv.Pages[cntPgLoadS150Reserv + 1]).ShowModal;
          modRes := TfrxDialogPage( //Присвоение результата диалога
            frxRLoadS150Reserv.Pages[cntPgLoadS150Reserv + 1]).ModalResult;

          if (modRes = mrYes) then //Связь пакета документов с Трансформатором
            begin
            end //if (modRes = mrYes) then
          else if (modRes = mrNo) then //Разрыв связи пакета и Трансформатора
            begin
            end; //else if (modRes = mrNo) then

          if (modRes = mrYesToAll) then //Заполнение режимных замеров
            begin //выборанного в списке диалоговой формы Трансформатора путём
              if vCmbBxCtrl.ItemIndex <> -1 then //повторного открытия диалога
                begin
                  //subst150PowerTransIdx  := vCmbBxCtrl.ItemIndex;
                  DMReportsENetObject.zqryEWFGauge150.Close;
                  DMReportsENetObject.zqryEWFGauge150.ParamByName(
                      'substation150refcode').AsInteger :=
                    DMReportsENetObject.codeS150;
                  DMReportsENetObject.zqryEWFGauge150.ParamByName(
                      'powertransrefcode').AsInteger :=
                    subst150PowerTransCodes[vCmbBxCtrl.ItemIndex];
                  DMReportsENetObject.zqryEWFGauge150.Open;
                  if DMReportsENetObject.zqryEWFGauge150.RecordCount > 0 then
                    begin //Передача промежуточных замеров полям диалога
                      if DMReportsENetObject.zqryEWFGauge150.FieldByName(
                        'tension').IsNull
                      then
                        TfrxEditControl(frxRLoadS150Reserv.FindObject(
                            'edtDlgPgGaugeTension')).Text := ''
                      else
                        TfrxEditControl(frxRLoadS150Reserv.FindObject(
                            'edtDlgPgGaugeTension')).Text :=
                          DMReportsENetObject.zqryEWFGauge150.FieldByName(
                            'tension').AsString;

                      if DMReportsENetObject.zqryEWFGauge150.FieldByName(
                        'current').IsNull
                      then
                        TfrxEditControl(frxRLoadS150Reserv.FindObject(
                            'edtDlgPgImax')).Text := ''
                      else
                        TfrxEditControl(frxRLoadS150Reserv.FindObject(
                            'edtDlgPgImax')).Text :=
                          DMReportsENetObject.zqryEWFGauge150.FieldByName(
                            'current').AsString;

                      if DMReportsENetObject.zqryEWFGauge150.FieldByName(
                        'dategauge').IsNull
                      then //Дата замера
                        TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
                            'dateEdtDlgPgGauging')).Date := Date
                      else
                        TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
                            'dateEdtDlgPgGauging')).DateEdit.DateTime :=
                          DMReportsENetObject.zqryEWFGauge150.FieldByName(
                            'dategauge').AsDateTime;
                      TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
                          'dateEdtDlgPgGauging')).DateEdit.Time :=
                        StrToTime('00:00:00');
                    end //if DMReportsENetObject.zqryEWFGauge150.RecordCount ...
                  else
                    begin
                      TfrxEditControl(frxRLoadS150Reserv.FindObject(
                        'edtDlgPgGaugeTension')).Text := '';
                      TfrxEditControl(frxRLoadS150Reserv.FindObject(
                        'edtDlgPgImax')).Text := ''
                    end;
                  Continue; //Переход на новую итерацию без продолжения цикла
                  //Goto Lbl_DlgPgShowBefore; //Метка - альтернатива циклу
                end; //if vCmbBxCtrl.ItemIndex <> -1 then
            end; //if (modRes = mrYesToAll) then

          if (modRes = mrRetry) then
            begin
              //Передача параметров запросу вызова серверной функции  удаления
              //записей таблицы Показателей уровней напряжения и силы тока на
              //клемах главных коммутационных аппаратов Трансформаторных
              //Подстанций 150 / 35 - 27 кВ, а также удаления записей
              //таблиц связей указанной выше таблицы с пакетами документов
              //подсистем ПРИСОЕДИНЕНИЕ I - IV до и после 01.08.2010,
              //c 14.03.2011, c 01.03.2013 гг. и запуск запроса
              if DMReportsENetObject.codeS150 <= 0 then
                begin
                  Application.MessageBox(
                    PChar('Не указана Понижающая Станция 150 / 35 - 27 кВ.'),
                    PChar('Внимание!'), MB_ICONWARNING);
                  Exit;
                end;
              if DMReportsENetObject.codeSubst150PowerTrans <= 0 then
                begin
                  Application.MessageBox(
                    PChar('Не указан Трансформатор 150 / 35 - 27 кВ.'),
                    PChar('Внимание!'), MB_ICONWARNING);
                  Exit;
                end;

              DMReportsENetObject.zqryEditEWFGauge150.Close;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_id_subsystem').Clear;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_id_pack').Clear; //Код пакета
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_substation150refcode' //Код Станции 150 / 35 - 27 кВ
                ).AsInteger := DMReportsENetObject.codeS150;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName( //Код
                'p_powertransrefcode').AsInteger := //выбранного Трансформатора
                  subst150PowerTransCodes[vCmbBxCtrl.ItemIndex];
                  //DMReportsENetObject.codeSubst150PowerTrans;
              TfrxDateEditControl(frxRLoadS150Reserv.FindObject( //Нулевое время
                'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00'); //замера
              DMReportsENetObject.vDateGauge := TfrxDateEditControl( //Дата
                frxRLoadS150Reserv.FindObject('dateEdtDlgPgGauging')).Date;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_dategauge'
                ).AsDate := DMReportsENetObject.vDateGauge; //Дата замера
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_current'
                ).Clear; //Показатель силы тока в промежуточной таблице, А
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_tension'
                ).Clear; //Показатель напряжения в промежуточной таблице, кВ
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_userfio'
                ).Clear; //ФИО текущего пользователя
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_isdelgauge').AsBoolean := True;
                  //Замер из промежуточной таблицы УДАЛЯЕТСЯ, а не меняется
              DMReportsENetObject.zqryEditEWFGauge150.Open;
              DMReportsENetObject.zqryEditEWFGauge150.First;
              strMsg := DMReportsENetObject.zqryEditEWFGauge150.FieldByName(
                'edit_ewfgauge150_result').AsString;
              Application.MessageBox(
                PChar(strMsg), PChar('Внимание!'), MB_ICONINFORMATION);

              //Очистка параметров
              DMReportsENetObject.vPowerCoef := 0.92; //Коэффициент мощности
              DMReportsENetObject.vDateGauge := MinDateTime; //Дата
              DMReportsENetObject.vGaugeTension := 0; //Напряжение, кВ
              DMReportsENetObject.vGaugeCurrent := 0; //Сила Тока, А

              //Вызов процедуры передачи через параметры показателей загрузки
              //Понижающих Трансформаторных Станций 150 / 35 - 27 кВ
              //из промежуточной таблиц комплекса EnergyWorkFlow в случае
              //отсутствия данных, совпадающих с протоколами режимных замеров,
              //в таблице комплекса EnergyNet с возможностью изменения этих
              //параметров и сохранением их в промежуточную таблицу WorkFlow
              //нужен, если после удаления замера не закрывать диалоговую форму
              //FastReport и сразу открывать печатную форму расчёта загрузки
              //DMReportsENetObject.St150TransformerQuerySetParam;

              //Очистка задающих параметры промежуточной таблицы полей диалога
              TfrxEditControl(frxRLoadS150Reserv.FindObject(   //Коэффициент
                'edtDlgPgPowerCoefficient')).Text := '0.92';  //мощности
              TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
                'dateEdtDlgPgGauging')).Date := Date; //Дата замера
              TfrxDateEditControl(frxRLoadS150Reserv.FindObject( //Нулевое время
                'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
              TfrxEditControl(frxRLoadS150Reserv.FindObject('edtDlgPgImax')
                ).Text := ''; //Ток, Амперы
              TfrxEditControl(frxRLoadS150Reserv.FindObject(
                'edtDlgPgGaugeTension')).Text := ''; //Напряжение, килоВольты
            end; //if (modRes = mrRetry) then

          if (modRes = mrRetry) or (modRes = mrOk) or (modRes = mrAll) then
            begin
              for m := Low(packIdArray) to High(packIdArray) do
                begin //Заполнение признака РЕАЛИЗОВАННОСТИ для СУЩЕСТВУЮЩИХ ТУ
                  with DMReportsENetObject.qryCntTechTerms do
                    begin
                      Close;
                      ParamByName('id_pack').AsInteger := packIdArray[m];
                      ParamByName('id_ss').AsInteger := subSystemIdArray[m];
                      Open;
                      case subSystemIdArray[m] of
                        SS_CONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsCN
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdCN;
                        SS_NEWCONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsNCN
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdNCN;
                        SS_CONNECTION_20110314:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsCN20110314
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdCN20110314;
                        SS_ELECTRICINSTALLACCESSPOWER:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsEAP
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdEAP;
                      end; //case subSystemIdArray[m] of
                    end; //with qryCntTechTerms do
                  with qryTechTermsInsOrUpd do
                    begin
                      if vChLstBxCtrl.Checked[m] then
                        ParamByName('is_realized').AsInteger := 1
                      else
                        ParamByName('is_realized').AsInteger := 0;
                      ParamByName('id_pack').AsInteger := packIdArray[m];
                      ExecSQL;
                    end; //with qryTechTermsInsOrUpd do
                end; //for m := Low(packIdArray) to High(packIdArray) do

              for m := Low(packIdRealizArray) to High(packIdRealizArray) do
                begin //Очистка признака РЕАЛИЗОВАННОСТИ для СУЩЕСТВУЮЩИХ ТУ
                  with DMReportsENetObject.qryCntTechTerms do
                    begin
                      Close;
                      ParamByName('id_pack').AsInteger := packIdRealizArray[m];
                      ParamByName('id_ss').AsInteger :=
                        subSystemIdRealizArray[m];
                      Open;
                      case subSystemIdRealizArray[m] of
                        SS_CONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsCN
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdCN;
                        SS_NEWCONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsNCN
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdNCN;
                        SS_CONNECTION_20110314:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsCN20110314
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdCN20110314;
                        SS_ELECTRICINSTALLACCESSPOWER:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTInsEAP
                          else
                            qryTechTermsInsOrUpd :=
                              DMReportsENetObject.qryTTUpdEAP;
                      end; //case subSystemIdRealizArray[m] of
                    end; //with qryCntTechTerms do
                  with qryTechTermsInsOrUpd do
                    begin
                      if vChLstBxCtrlRealiz.Checked[m] then
                        ParamByName('is_realized').AsInteger := 1
                      else
                        ParamByName('is_realized').AsInteger := 0;
                      ParamByName('id_pack').AsInteger := packIdRealizArray[m];
                      ExecSQL;
                    end; //with qryTechTermsInsOrUpd do
                end; //for m := Low(packIdRealizArray)
                     //to High(packIdRealizArray) do

              //Передача текстовых значений реквизитов из заполненных полей
              //диалоговой формы FastReport значениям полей печатной формы
              TfrxMemoView(frxRLoadS150Reserv.FindObject('memCalculater')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgCalculater'));
              TfrxMemoView(frxRLoadS150Reserv.FindObject('memValidater')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgValidater'));

              TfrxMemoView(frxRLoadS150Reserv.FindObject('memCalculaterPost')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgCalculaterPost'));
              TfrxMemoView(frxRLoadS150Reserv.FindObject('memValidaterPost')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgValidaterPost'));

              //Передача значений показателей замеров из заполненных полей
              //диалоговой формы FastReport локальным переменным этого модуля
              if (modRes = mrOk) or (modRes = mrAll) then
                begin
                  strGaugeCurrent :=
                    TfrxEditControl(frxRLoadS150Reserv.FindObject(
                      'edtDlgPgImax')).Text; //Сила тока, А
                  strGaugeTension :=
                    TfrxEditControl(frxRLoadS150Reserv.FindObject(
                      'edtDlgPgGaugeTension')).Text; //Напряжение, кВ
                  strPowerCoef := TfrxEditControl(frxRLoadS150Reserv.FindObject(
                    'edtDlgPgPowerCoefficient')).Text; //Коэффициент мощности

                  TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
                    'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
                  if strGaugeCurrent <> '' then
                    begin
                      DMReportsENetObject.vDateGauge := //Дата замера
                        TfrxDateEditControl(frxRLoadS150Reserv.FindObject(
                          'dateEdtDlgPgGauging')).Date;
                      if DMReportsENetObject.vDateGauge = MinDateTime then
                        DMReportsENetObject.vDateGauge := Date;
                    end
                  else
                    DMReportsENetObject.vDateGauge := Date;

                  if strGaugeCurrent <> '' then //Сила тока, А
                    DMReportsENetObject.vGaugeCurrent :=
                      StrToFloat(strGaugeCurrent);
                  if strGaugeTension <> '' then //Напряжение, кВ
                    DMReportsENetObject.vGaugeTension :=
                      StrToFloat(strGaugeTension);
                  if strPowerCoef <> '' then //Коэффициент мощности
                    DMReportsENetObject.vPowerCoef :=
                      StrToFloat(strPowerCoef);
                end; //if (modRes = mrOk) or (modRes = mrAll) then

              if (DMReportsENetObject.vGaugeCurrent > 0) //Модальному
              and (modRes <> mrYesToAll) then //результату присваивается
                begin //значение mrYesToAll при выборе трансформатора
                  //Передача заданных параметров в запрос вызова серверной
                  //функции оперирования записями таблицы Показателей уровней
                  //напряжения и силы тока на клемах главных коммутационных
                  //аппаратов Трансформаторов Подстанций 150 / 35 - 27 кВ,
                  //а также записями таблиц связей указанной выше таблицы с
                  //пакетами документов подсистем ПРИСОЕДИНЕНИЕ I - IV до и
                  //после 01.08.2010, c 14.03.2011, c 01.03.2013 гг.
                  //с последующим запуском запроса
                  DMReportsENetObject.zqryEditEWFGauge150.Close;
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_id_subsystem').AsInteger := //Код подсистемы
                    DataModuleReportsENetObject.subsystemID;
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName( //пакет
                      'p_id_pack').AsInteger := DMReportsENetObject.packageID;
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_substation150refcode').AsInteger :=
                    DMReportsENetObject.codeS150; //Станция 150 / 35 - 27 кВ
                  //DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                  //  'p_powertransrefcode').AsInteger := codeSubst150PowerTrans;
                  //Код выбранного в списке диаловой формы FastReport
                  //Силового Трансформатора 150 / 35 - 27 кВ
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_powertransrefcode').AsInteger :=
                    subst150PowerTransCodes[vCmbBxCtrl.ItemIndex];

                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_dategauge').AsDate :=
                    DMReportsENetObject.vDateGauge; //Дата замера
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_current').AsFloat := DMReportsENetObject.vGaugeCurrent;
                      //Сила тока промежуточной таблице, А
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_tension').AsFloat := DMReportsENetObject.vGaugeTension;
                      //Напряжение в промежуточной таблице, кВ
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_userfio').AsString := ''; //CURRENT_USER_FIO
                      //ФИО текущего пользователя
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_isdelgauge').AsBoolean := False; //Замер РЕДАКТИРУЕТСЯ

                  if modRes = mrOk then
                    DMReportsENetObject.zqryEditEWFGauge150.ExecSQL
                  else //if modRes = mrAll then
                    begin
                      DMReportsENetObject.zqryEditEWFGauge150.Open;
                      DMReportsENetObject.zqryEditEWFGauge150.First;
                      strMsg :=
                        DMReportsENetObject.zqryEditEWFGauge150.FieldByName(
                          'edit_ewfgauge150_result').AsString;
                      Application.MessageBox(
                        PChar(strMsg), PChar('Внимание!'), MB_ICONINFORMATION);
                    end; //else //if modRes = mrAll then
                end //if (vGaugeCurrent > 0) or then //Если параметры задавались
//              else //Если параметры НЕ задавались
//                begin
//                  //Очистка параметров задействованной в отчёте
//                  //выборки Трансформаторов 150 / 35 - 27 кВ
//                  DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
//                    'gaugetension').Clear;
//                  DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
//                    'gaugecurrent').Clear;
//                  DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
//                    'powercoefficient').Clear;
//                  DMReportsENetObject.zqryLoadS150ReservENPowTrans.ParamByName(
//                    'dategauge').Clear;
//
//                  //Очистка параметров задействованной в отчёте итоговой
//                  //строковой выборки Трансформаторов 150 / 35 - 27 кВ
//                  DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
//                    'gaugetension').Clear;
//                  DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
//                    'gaugecurrent').Clear;
//                  DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
//                    'powercoefficient').Clear;
//                  DMReportsENetObject.zqryLoadS150ReservENPowTransStr.ParamByName(
//                    'dategauge').Clear;
//                end; //else //Если параметры НЕ задавались
            end; //if (modRes = mrRetry) or (modRes = mrOk) or (modRes = ...

          //if (modRes = mrCancel) then Exit
          //else
          if (modRes = mrAll) or (modRes = mrRetry) or (modRes = mrYesToAll)
          or (modRes = mrYes) or (modRes = mrNo) then
            Continue //Переход на новую итерацию без продолжения цикла
            //Goto Lbl_DlgPgShowBefore //Метка - альтернатива циклу
          else if (modRes = mrOk) then
            begin
              //Вызов процедуры передачи через параметры показателей загрузки
              //Понижающих Трансформаторных Станций 150 / 35 - 27 кВ
              //из промежуточной таблиц комплекса EnergyWorkFlow в случае
              //отсутствия данных, совпадающих с протоколами режимных замеров,
              //в таблице комплекса EnergyNet с возможностью изменения этих
              //параметров и сохранением их в промежуточную таблицу WorkFlow
              DMReportsENetObject.St150TransformerQuerySetParam;
              frxRLoadS150Reserv.ShowReport();
            end;
        end; //while not ((modRes = mrOk) or (modRes = mrCancel)) do
    end; //if (Sender.Name = 'PictureLightning') then
end; //TDMReportsENetObject.frxRLoadS150ReservClickObject(...

procedure TDMReportsENetObject.frxRLoadS150ReservClosePreview(Sender: TObject);
var strTemp, strFileName: String;
begin
  if Application.MessageBox(//Сохранение отчёта во вложениях
    PChar('Зберігти Резерв потужності во вкладеннях?'), PChar('Увага!'),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES
  then
    begin
      frxPDFExport1.DefaultPath := 'Temp\';      

      strTemp :=
        ExtractFilePath(Application.ExeName) + frxPDFExport1.DefaultPath;

      if not DirectoryExists(strTemp) then //проверка существавания паки
        CreateDir(strTemp); //и создание при необходимости
      frxPDFExport1.DefaultPath := strTemp;

      case DataModuleReportsENetObject.subsystemID of
        SS_CONNECTION:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS150ReservPackCN.FieldByName(
              'ss150name').AsString;
        SS_NEWCONNECTION:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS150ReservPackNCN.FieldByName(
              'ss150name').AsString;
        SS_CONNECTION_20110314:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS150ReservPackCN20110314.FieldByName(
              'ss150name').AsString;
        SS_ELECTRICINSTALLACCESSPOWER:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS150ReservPackEAP.FieldByName(
              'ss150name').AsString;
      end;

      //SUPP-12460. Замена одинарных и двойных кавычек, точек, пробелов, левых
      //и правых слэшев, а также некорректно сохранённых символов в названии
      //файла на нижние подчёркивания
      strFileName := frxPDFExport1.FileName;
      strFileName := ReplaceInvalidChar(strFileName);
      if (Pos('''', strFileName) > 0) or (Pos('.', strFileName) > 0)
      or (Pos(' ', strFileName) > 0) then
        begin
          strFileName := AutoChange(strFileName, '''', '_');
          strFileName := AutoChange(strFileName, '.', '_');
          strFileName := AutoChange(strFileName, ' ', '_');
          strFileName := AutoChange(strFileName, '\', '_');
          strFileName := AutoChange(strFileName, '/', '_');
          strFileName := AutoChange(strFileName, '"', '_');
          strFileName := strFileName + '.pdf';
          frxPDFExport1.FileName := strFileName;
        end;

      //Экспорт в формате *.pdf и последующее сохранение
      frxRLoadS150Reserv.Export(frxPDFExport1);

      {frmInsertDocEWF := TfrmInsertDocEWF.Create(Application, dsInsert);
      if not Assigned(DMReportsEWF) then
	      Application.CreateForm(TDMReportsEWF, DMReportsEWF);
      try
        frmInsertDocEWF.spbDocPath.Visible := False;
        frmInsertDocEWF.id_ss := DataModuleReportsENetObject.subsystemID;
        frmInsertDocEWF.id_pack := DMReportsENetObject.packageID;
        frmInsertDocEWF.id_movement := DMReportsENetObject.movementID;
        frmInsertDocEWF.id_state := DMReportsENetObject.stateID;
        frmInsertDocEWF.odDoc.InitialDir := strTemp;
        frmInsertDocEWF.edtDocPath.Text := frxPDFExport1.FileName;
        frmInsertDocEWF.id_doctype :=
          CN_DOCTYPE_RESERV_STATION_VOLTAGE_HIGH_150_35_27;
        case subsystemID of
          SS_CONNECTION: //ПРИСОЕДИНЕНИЕ I
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesCN, //Типы документов ПРИСОЕДИНЕНИЕ I до 01.08.2010 г.
                DMConnection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_DocTypesCN); //Типы документов ПРИСОЕДИНЕНИЕ I до 01.08.2010 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentCN, //Добавление вложения CN-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_InsertDocAttachmentCN, //Добавление вложения CN-пакета
                DMConnection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentCN, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_InsertLinkDocAttachmentCN, //Добавление ссылки к вложению
                DMConnection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes := DMConnection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMConnection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMConnection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMConnection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads150ReservPackCN.FieldByName(
                  'ss150name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMConnection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_CONNECTION: //ПРИСОЕДИНЕНИЕ I
          SS_NEWCONNECTION: //ПРИСОЕДИНЕНИЕ II
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesNCN, //Типы документов ПРИСОЕДИНЕНИЕ II с 01.08.2010 г.
                DMNewConnection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_DocTypesNCN); //Типы документов ПРИСОЕДИНЕНИЕ II с 01.08.2010 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentNCN, //Добавление вложения NCN-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_InsertDocAttachmentNCN, //Добавление вложения NCN-пакета
                DMNewConnection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentNCN, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_InsertLinkDocAttachmentNCN, //Добавление ссылки к вложению
                DMNewConnection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes := DMNewConnection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMNewConnection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMNewConnection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMNewConnection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads150ReservPackNCN.FieldByName(
                  'ss150name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMNewConnection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_NEWCONNECTION: //ПРИСОЕДИНЕНИЕ II
          SS_CONNECTION_20110314: //ПРИСОЕДИНЕНИЕ III
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesCN_20110314, //Типы документов ПРИСОЕДИНЕНИЕ III с 14.03.2011 г.
                DMCN20110314Connection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesCN20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_DocTypesCN_20110314); //Типы документов ПРИСОЕДИНЕНИЕ III с 14.03.2011 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentCN_20110314, //Добавление CN20110314-вложения
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentCN_20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_InsertDocAttachmentCN20110314, //Добавление вложения CN20110314-пакета
                DMCN20110314Connection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentCN20110314, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentCN20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_InsertLinkDocAttachmentCN20110314, //Добавление ссылки к вложению
                DMCN20110314Connection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes :=
                DMCN20110314Connection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMCN20110314Connection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMCN20110314Connection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMCN20110314Connection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads150ReservPackCN20110314.FieldByName(
                  'ss150name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMCN20110314Connection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_CONNECTION_20110314: //ПРИСОЕДИНЕНИЕ III
          SS_ELECTRICINSTALLACCESSPOWER: //ПРИСОЕДИНЕНИЕ IV
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesEAP, //Типы документов ПРИСОЕДИНЕНИЕ IV с 01.03.2013 г.
                DMEAPElectricInstallAccessPower.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_DocTypesEAP); //Типы документов ПРИСОЕДИНЕНИЕ IV с 01.03.2013 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentEAP, //Добавление вложения EAP-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_InsertDocAttachmentEAP, //Добавление вложения EAP-пакета
                DMEAPElectricInstallAccessPower.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentEAP, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_InsertLinkDocAttachmentEAP, //Добавление ссылки к вложению
                DMEAPElectricInstallAccessPower.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes :=
                DMEAPElectricInstallAccessPower.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMEAPElectricInstallAccessPower.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMEAPElectricInstallAccessPower.zspInsertLinkDocAttachment;
              //frmInsertDocEWF.qryAttachedDocs :=
              //  DMEAPElectricInstallAccessPower.qryAttachedDocs;
              frmInsertDocEWF.qryAttachedDocs :=
                DMEAPElectricInstallAccessPower.qryAttachedDocsVersions;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoadS150ReservPackEAP.FieldByName(
                  'ss150name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMEAPElectricInstallAccessPower do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_ELECTRICINSTALLACCESSPOWER: //ПРИСОЕДИНЕНИЕ IV
        end; //case subsystemID of
      finally
        frmInsertDocEWF.Free;
        DMReportsEWF.Free;
        DMReportsEWF := nil;
      end;}
    end; //if Application.MessageBox(//Сохранение отчёта во вложениях ...

  DMReportsENetObject.hLoadS150Reserv := 0; //Высвобождение отчёта из памяти
  //Уменьшение на единицу количества открытых отчётов из модуля невизуальных
  Dec(LoadReportENetObjectCount); //компонентов взаимодействия с EnergyNet
  //Если не открыто ни одного взаимодействующего с EnergyNet
  if LoadReportENetObjectCount = 0 then //отчёта из DataModuleReportsENObject
    begin //Выгрузка содержащего отчёты взаимодействия с EnergyNet
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free; //модуля невизуальных компонентов
      DMReportsENetObject := nil;
    end; //if LoadReportENetObjectCount = 0 then ...
end; //procedure TDMReportsENetObject.frxRLoadS150ReservClosePreview(...

//Процедура передачи через параметры показателей загрузки понижающих
//Трансформаторных Станций 35 - 27 / 10 - 6 кВ
//из промежуточной таблиц комплекса EnergyWorkFlow в случае отсутствия
//достоверных данных, совпадающих с протоколами режимных замеров,
//в таблице комплекса EnergyNet с возможностью редактирования этих
//параметров и сохранением их в промежуточную таблицу EnergyWorkFlow.
//Применяется для формирования загружаемых извне отчёт о Резерве
//Трансформаторной Станции, такой как frxRLoadS35Reserv
procedure TDMReportsENetObject.St35TransformerQuerySetParam(
  changeOnlyDMVar: Boolean = False); //изменять только переменные модуля
begin
  //Инициализация параметров происходит перед вызовом процедуры
  //DMReportsENetObject.vGaugeTension := 0; //Напряжение, кВ
  //DMReportsENetObject.vGaugeCurrent := 0; //Силы Тока, А
  //DMReportsENetObject.vDateGauge := MinDateTime; //Дата замера
  //DMReportsENetObject.vPowerCoef := 0.92; //Коэффициент мощности

  //Присвоение параметров
  DMReportsENetObject.zqryEWFGauge150.Close;
  DMReportsENetObject.zqryEWFGauge150.ParamByName(
    'substation150refcode').AsInteger :=
      DMReportsENetObject.codeS35;
  DMReportsENetObject.zqryEWFGauge150.ParamByName(
    'powertransrefcode').AsInteger :=
      DMReportsENetObject.codeSubst35PowerTrans;
  DMReportsENetObject.zqryEWFGauge150.Open;
  if DMReportsENetObject.zqryEWFGauge150.RecordCount > 0 then
    begin //Передача в параметры показателей промежуточной таблицы
      DMReportsENetObject.zqryEWFGauge150.First;
      DMReportsENetObject.vGaugeTension := //Напряжение, кВ
        DMReportsENetObject.zqryEWFGauge150.FieldByName('tension').AsFloat;
      DMReportsENetObject.vGaugeCurrent := //Силы Тока, А
        DMReportsENetObject.zqryEWFGauge150.FieldByName('current').AsFloat;
      //DMReportsENetObject.vPowerCoef := 0; //Коэффициент мощности
      DMReportsENetObject.vDateGauge :=
        DMReportsENetObject.zqryEWFGauge150.FieldByName(
          'dategauge').AsDateTime; //Дата замера
    end; //if DMReportsENetObject.zqryEWFGauge150.RecordCount...

  if not changeOnlyDMVar then //явно не указано менять только переменные
    begin
      //Передача параметров запросу списка
      //Силовых Трансформаторов 35 - 27 / 10 - 6 кВ
      DMReportsENetObject.zqryLoadS35ReservENPowTrans.Close;
      if (vDateGauge = MinDateTime) or (DateToStr(vDateGauge) = '30.12.1899')
      then
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'dategauge').Clear
      else      
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'dategauge').AsDateTime :=
            DMReportsENetObject.vDateGauge;      
      if DMReportsENetObject.vGaugeTension = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'gaugetension').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'gaugetension').AsFloat :=
            DMReportsENetObject.vGaugeTension;
      if DMReportsENetObject.vGaugeCurrent = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'gaugecurrent').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'gaugecurrent').AsFloat :=
            DMReportsENetObject.vGaugeCurrent;
      if DMReportsENetObject.codeS35 = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'code_substation35').Clear
      else //Код Станции 35 - 27 / 10 - 6 кВ
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'code_substation35').AsInteger :=  DMReportsENetObject.codeS35;           
      if DMReportsENetObject.codeSubst35PowerTrans = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'code_st35powertrans').Clear
      else //Код Трансформатора 35 - 27 / 10 - 6 кВ
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
          'code_st35powertrans').AsInteger := 
            DMReportsENetObject.codeSubst35PowerTrans;
      

      //Передача параметров запросу строчной информации о
      //Силовых Трансформаторах 35 - 27 / 10 - 6 кВ
      DMReportsENetObject.zqryLoadS35ReservENPowTransStr.Close;
      if (vDateGauge = MinDateTime) or (DateToStr(vDateGauge) = '30.12.1899')
      then
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'dategauge').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'dategauge').AsDateTime :=
            DMReportsENetObject.vDateGauge;
      if DMReportsENetObject.vGaugeTension = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
        'gaugetension').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'gaugetension').AsFloat :=
            DMReportsENetObject.vGaugeTension;
      if DMReportsENetObject.vGaugeCurrent = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'gaugecurrent').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'gaugecurrent').AsFloat :=
            DMReportsENetObject.vGaugeCurrent;
      if DMReportsENetObject.codeSubst35PowerTrans = 0 then
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'code_st35powertrans').Clear
      else //Код Трансформатора 35 - 27 / 10 - 6 кВ
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'code_st35powertrans').AsInteger := 
            DMReportsENetObject.codeSubst35PowerTrans;

      //Передача параметров запросу агреггированных значений загрузки
      //Силовых Трансформаторов 35 - 27 / 10 - 6 кВ
      DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.Close;
      if DMReportsENetObject.vGaugeTension = 0 then
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'gaugetension').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'gaugetension').AsFloat := DMReportsENetObject.vGaugeTension;
      if DMReportsENetObject.vGaugeCurrent = 0 then
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'gaugecurrent').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'gaugecurrent').AsFloat := DMReportsENetObject.vGaugeCurrent;
      if DMReportsENetObject.vPowerCoef = 0 then
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'powercoefficient').Clear
      else
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'powercoefficient').AsFloat := DMReportsENetObject.vPowerCoef;
      if DMReportsENetObject.codeSubst35PowerTrans = 0 then
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'code_st35powertrans').Clear
      else //Код Трансформатора 35 - 27 / 10 - 6 кВ
        DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.ParamByName(
          'code_st35powertrans').AsInteger := 
            DMReportsENetObject.codeSubst35PowerTrans;

      //DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.Open;
      //DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.First;
    end; //if not changeOnlyDMVar then
end; //procedure TDMReportsENetObject.St35TransformerQuerySetParam;

procedure TDMReportsENetObject.frxRLoadS35ReservClickObject(Sender: TfrxView;
  Button: TMouseButton; Shift: TShiftState; var Modified: Boolean);
//Label Lbl_DlgPgShowBefore; //Метка перед вызовом диалоговой формы FastReport
var m, subst35PowerTransIdx: Integer;
  //vChLstBxCtrlPurpose, vChLstBxCtrlPurposeRealiz,
  vChLstBxCtrl, vChLstBxCtrlRealiz,
  vChLstBxCtrlAfterGuaging, vChLstBxCtrlFinish: TfrxCheckListBoxControl;
  vCmbBxCtrl: TfrxComboBoxControl;
  //subSystemIdPurposeArray, packIdPurposeArray,
  //subSystemIdPurposeRealizArray, packIdPurposeRealizArray,
  //subSystemIdAfterGuagingArray, packIdAfterGuagingArray,
  //subSystemIdFinishArray, packIdFinishArray,
  subSystemIdArray, packIdArray,
  subSystemIdRealizArray, packIdRealizArray: array of Integer;
  qryTechTermsInsOrUpd: TZQuery;
  modRes: TModalResult;
  //Промежуточные показатели замеров трансформатора 150 / 35 - 27 / 10 - 6 кВ
  strGaugeTension, //Показатель Напряжения в промежуточной таблице, кВ
  strGaugeCurrent, //Показатель Силы Тока в промежуточной таблице, А
  strPowerCoef, //Коэффициент мощности
  strMsg: String; //Текст сообщения об удалении промежуточного замера

  function GetTextOfTfrxMemoControl(mCtrlName: String): String;
  var i, m: Integer; s, f: String; vMC: TfrxMemoControl;
  begin
    vMC := TfrxMemoControl(frxRLoadS35Reserv.FindObject(mCtrlName));
    s := '';
    for i := 0 to vMC.Lines.Count - 1 do
      s := s + vMC.Lines[i];
    Result := s;
  end; //function GetTextOfTfrxMemoControl(mCtrlName: String): String;
begin
  if Button <> mbLeft then
    Exit;
  if (Sender.Name = 'PictureLightning') then
    begin
      //Инициализация строковых переменных для предотвращения неправильной
      //передачи значения полей диалоговой формы FastReport показателям
      //промежуточных замеров трансформатора 150 / 35 - 27 / 10 - 6 кВ
      strGaugeTension := ''; //Напряжение в промежуточной таблице, кВ
      strGaugeCurrent := ''; //Показатель Силы Тока в промежуточной таблице, А
      strPowerCoef := '0.92'; //Коэффициент мощности
      strMsg := ''; //Текст сообщения об удалении промежуточного замера, а
        //также выводимая в список Силовых Трансформаторов строка

      //Выданные Технические Условия, БЕЗ признака РЕАЛИЗОВАННОСТИ
      vChLstBxCtrl := TfrxCheckListBoxControl(
        frxRLoadS35Reserv.FindObject('chLstBxDlgPgTechTerms'));
      vChLstBxCtrlAfterGuaging := TfrxCheckListBoxControl(
        frxRLoadS35Reserv.FindObject('chLstBxDlgPgTechTermsAfterGuaging'));
      vChLstBxCtrl.Height := vChLstBxCtrlAfterGuaging.Top +
        vChLstBxCtrlAfterGuaging.Height - vChLstBxCtrl.Top;

      vChLstBxCtrl.Items.Clear;
      DMReportsENetObject.zqryLoadS35ReservTrPacks.Close;
      DMReportsENetObject.zqryLoadS35ReservTrPacks.DataSource := nil;

      DMReportsENetObject.zqryLoadS35ReservTrPacks.ParamByName( //Код Станции
        'code_substation35').AsInteger := DMReportsENetObject.codeS35;
      DMReportsENetObject.zqryLoadS35ReservTrPacks.ParamByName(
        'code_st35powertrans').AsInteger := //Код Силового Трансформатора
          DMReportsENetObject.codeSubst35PowerTrans; //35 - 27 / 10 - 6 кВ
      DMReportsENetObject.zqryLoadS35ReservTrPacks.ParamByName('id_subsystem'
        ).AsInteger := DataModuleReportsENetObject.subsystemID;
      DMReportsENetObject.zqryLoadS35ReservTrPacks.ParamByName('id_pack'
        ).AsInteger := DMReportsENetObject.packageID;
      DMReportsENetObject.zqryLoadS35ReservTrPacks.Open;
      DMReportsENetObject.zqryLoadS35ReservTrPacks.First;
      SetLength(subSystemIdArray, zqryLoadS35ReservTrPacks.RecordCount);
      SetLength(packIdArray, zqryLoadS35ReservTrPacks.RecordCount);
      while not (DMReportsENetObject.zqryLoadS35ReservTrPacks.Eof) do
        begin
          m := zqryLoadS35ReservTrPacks.RecNo - 1;
          vChLstBxCtrl.Items.AddObject(
            DMReportsENetObject.zqryLoadS35ReservTrPacks.FieldByName(
                'name').AsString + ' (' + 
              DMReportsENetObject.zqryLoadS35ReservTrPacks.FieldByName(
                'name_ss').AsString + ', пакет ' + 
              DMReportsENetObject.zqryLoadS35ReservTrPacks.FieldByName(
                'id_pack').AsString + ')',
            TObject(m));
          vChLstBxCtrl.Checked[vChLstBxCtrl.Items.Count - 1] :=
            (DMReportsENetObject.zqryLoadS35ReservTrPacks.FieldByName(
              'is_realized').AsInteger = 1);
          subSystemIdArray[m] :=
            DMReportsENetObject.zqryLoadS35ReservTrPacks.FieldByName(
              'id_ss').AsInteger;
          packIdArray[m] :=
            DMReportsENetObject.zqryLoadS35ReservTrPacks.FieldByName(
              'id_pack').AsInteger;
          DMReportsENetObject.zqryLoadS35ReservTrPacks.Next;
        end; //while not (DMReportsENetObject.zqryLoadS35ReservTrPacks.Eof) do
      DMReportsENetObject.zqryLoadS35ReservTrPacks.DataSource :=
        DMReportsENetObject.dsLoadS35ReservENPowTrans;

      //Существующие Технические Условия, С признаком РЕАЛИЗОВАННОСТИ
      vChLstBxCtrlRealiz := TfrxCheckListBoxControl(
        frxRLoadS35Reserv.FindObject('chLstBxDlgPgTechTermsRealiz'));
      vChLstBxCtrlFinish := TfrxCheckListBoxControl(
        frxRLoadS35Reserv.FindObject('chLstBxDlgPgTechTermsFinish'));
      vChLstBxCtrlRealiz.Height := vChLstBxCtrlFinish.Top +
        vChLstBxCtrlFinish.Height - vChLstBxCtrlRealiz.Top;

      vChLstBxCtrlRealiz.Items.Clear;
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.Close;
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.DataSource := nil;
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.ParamByName( //Станция
          'code_substation35').AsInteger := DMReportsENetObject.codeS35;
        //DMReportsENetObject.zqryLoadS35ReservPack.FieldByName(
        //  'code_substation35').AsInteger;
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.ParamByName(
          'code_st35powertrans').AsInteger := //Код Силового Трансформатора
        DMReportsENetObject.codeSubst35PowerTrans; //35 - 27 / 10 - 6 кВ
        //DMReportsENetObject.zqryLoadS35ReservPack.FieldByName(
        //  'code_st35powertrans').AsInteger;
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.Open;
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.First;
      SetLength(subSystemIdRealizArray, 
        DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.RecordCount);
      SetLength(packIdRealizArray, 
        DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.RecordCount);
      while not (DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.Eof) do
        begin
          m := DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.RecNo - 1;
          vChLstBxCtrlRealiz.Items.AddObject(
            DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.FieldByName(
              'name').AsString + ' (' + 
            DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.FieldByName(
              'name_ss').AsString + ', пакет ' +
            DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.FieldByName(
            'id_pack').AsString + ')', TObject(m));
          vChLstBxCtrlRealiz.Checked[vChLstBxCtrlRealiz.Items.Count - 1] :=
            (DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.FieldByName(
              'is_realized').AsInteger = 1);
          subSystemIdRealizArray[m] :=
            DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.FieldByName(
              'id_ss').AsInteger;
          packIdRealizArray[m] :=
            DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.FieldByName(
              'id_pack').AsInteger;
          DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.Next;
        end; //while not (DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz...
      DMReportsENetObject.zqryLoadS35ReservTrPacksRealiz.DataSource := 
        DMReportsENetObject.dsLoadS35ReservENPowTrans;

      //Вызов процедуры для извлечения в переменные показателей загрузки
      //Понижающих Трансформаторных Станций 150 / 35 - 27 / 10 - 6 кВ
      //из промежуточной таблиц комплекса WorkFlow в случае отсутствия
      //достоверных совпадающих с протоколами режимных замеров данных в таблице
      //комплекса EnergyNet с последующей передача переменных полям формы
      //и параметров запросов загрузки
      DMReportsENetObject.St35TransformerQuerySetParam;

      //Строчная информация о Силовых Трансформаторах 35 - 27 / 10 - 6 кВ
      //zqryLoadS35ReservENPowTransStr.Close;
      DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
          'code_substation35').AsInteger := 
        DMReportsENetObject.zqryLoadS35ReservPack.FieldByName(
          'code_substation35').AsInteger;
      DMReportsENetObject.zqryLoadS35ReservENPowTransStr.Open;

      TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgNominalPower')
          ).Text := 
        DMReportsENetObject.zqryLoadS35ReservENPowTransStr.FieldByName(
          'trpowers').AsString;

      //Список Силовых Трансформаторов 35 - 27 / 10 - 6 кВ
      DMReportsENetObject.zqryLoadS35ReservENPowTrans.Open;
      DMReportsENetObject.zqryLoadS35ReservENPowTrans.First;
      subst35PowerTransIdx := -1; //Инициализация индекса списка
      vCmbBxCtrl := TfrxComboBoxControl(frxRLoadS35Reserv.FindObject(
        'cmbBxDlpPgENSubst150PowerTrans'));
      vCmbBxCtrl.Items.Clear; //vCmbBxCtrl.Clear;
      SetLength(subst35PowerTransCodes, 
        DMReportsENetObject.zqryLoadS35ReservENPowTrans.RecordCount);
      while not DMReportsENetObject.zqryLoadS35ReservENPowTrans.Eof do
        begin
          m := DMReportsENetObject.zqryLoadS35ReservENPowTrans.RecNo - 1;
          subst35PowerTransCodes[m] := 
            DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
              'code_st35powertrans').AsInteger;
          if subst35PowerTransCodes[m] > 0 then
            begin
              strMsg :=
                DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
                  'matname').AsString;
              if strMsg <> 'ТУ, залежні від Підстанції 35 / 10 - 6 кВ ' +
                'без вказівки трансформатору'
              then
                strMsg :=
                  DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
                    'trnumber').AsString + ' - ' + strMsg + ' (код EnergyNet ' 
                    + IntToStr(subst35PowerTransCodes[m]) + ')'
              else
                strMsg := 
                  DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
                    'trnumber').AsString;
              vCmbBxCtrl.Items.AddObject(strMsg, TObject(m));
              if subst35PowerTransCodes[m] = 
                DMReportsENetObject.codeSubst35PowerTrans 
              then
                subst35PowerTransIdx := m;
            end; //if subst35PowerTransCodes[m] > 0 then
          DMReportsENetObject.zqryLoadS35ReservENPowTrans.Next;
        end; //while not DMReportsENetObject.zqryLoadS35ReservENPowTrans.Eof do
      if subst35PowerTransIdx <> -1 then
        vCmbBxCtrl.ItemIndex := subst35PowerTransIdx;

      //Агреггированные значения загрузки Трансформаторов 35 - 27 / 10 - 6 кВ      
      DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.Open;
      DMReportsENetObject.zqryLoadS35ReservTrPacksAgreg.First;
            

      //Заполнение полей диалоговой формы FastReport
      if DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
        'gaugetension').IsNull 
      then
        TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgGaugeTension')
          ).Text := DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
            'pointtransgaugetension').AsString
      else
        TfrxEditControl(
          frxRLoadS35Reserv.FindObject('edtDlgPgGaugeTension')).Text :=
            DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
              'gaugetension').AsString;

      if DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
        'gaugecurrent').IsNull then
        TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgImax')).Text :=
          DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
            'pointtransgaugecurrent').AsString
      else
        TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgImax')).Text :=
          DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
            'gaugecurrent').AsString;

      if DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
        'powercoefficient').IsNull
      then
        TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgPowerCoefficient'
          )).Text := 
            DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
              'powercoefficient').AsString
      else
        TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgPowerCoefficient'
          )).Text := 
            DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
              'powercoefficient').AsString;

      if DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
        'dategauge').IsNull 
      then
        begin
          if DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
            'dategauge').IsNull 
          then
            TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
              'dateEdtDlgPgGauging')).Date := Date
          else
            TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
              'dateEdtDlgPgGauging')).Date :=
                DMReportsENetObject.zqryLoadS35ReservENPowTrans.FieldByName(
                  'dategauge').AsDateTime;
        end
      else
        TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
          'dateEdtDlgPgGauging')).Date :=
            DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
              'dategauge').AsDateTime;

      if TfrxMemoView(frxRLoadS35Reserv.FindObject('memCalculaterPost')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgCalculaterPost')
          ).Text := strReservStationCalculaterPost
      else
        TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgCalculaterPost')
          ).Text := TfrxMemoView(frxRLoadS35Reserv.FindObject(
            'memCalculaterPost')).Memo.Text;

      if TfrxMemoView(frxRLoadS35Reserv.FindObject('memCalculater')
        ).Memo.Text = ''
      then //http://10.77.11.28:8080/browse/SUPP-21520; SUPP-23927
        begin
          if strReservStationCalculater = '' then
            TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgCalculater')
              ).Text := '' //CURRENT_USER_FIO
          else
            TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgCalculater')
              ).Text := strReservStationCalculater
        end
      else
        TfrxMemoControl(
          frxRLoadS35Reserv.FindObject('memDlgPgCalculater')).Text :=
        TfrxMemoView(frxRLoadS35Reserv.FindObject('memCalculater')).Memo.Text;

      if TfrxMemoView(frxRLoadS35Reserv.FindObject('memValidaterPost')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgValidaterPost')
          ).Text := strReservStationValidaterPost
      else
        TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgValidaterPost')
          ).Text := TfrxMemoView(frxRLoadS35Reserv.FindObject(
            'memValidaterPost')).Memo.Text;

      if TfrxMemoView(frxRLoadS35Reserv.FindObject('memValidater')
        ).Memo.Text = ''
      then //SUPP-21520
        TfrxMemoControl(frxRLoadS35Reserv.FindObject('memDlgPgValidater')
          ).Text := strReservStationValidater
      else
        TfrxMemoControl(
          frxRLoadS35Reserv.FindObject('memDlgPgValidater')).Text :=
        TfrxMemoView(frxRLoadS35Reserv.FindObject('memValidater')).Memo.Text;

      if (DMReportsENetObject.vGaugeCurrent <> 0) then
        begin
          TfrxEditControl(frxRLoadS35Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text :=
              FloatToStr(DMReportsENetObject.vPowerCoef);
          TfrxDateEditControl(frxRLoadS35Reserv.FindObject( //Дата замера
            'dateEdtDlgPgGauging')).Date := DMReportsENetObject.vDateGauge; 
          TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgImax')
            ).Text := //Ток, Амперы 
            FloatToStr(DMReportsENetObject.vGaugeCurrent); 
          TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgGaugeTension')
            ).Text := //Напряжение, килоВольты
            FloatToStr(DMReportsENetObject.vGaugeTension); 
        end //if (vGaugeCurrent <> 0) then
      else //Очистка полей диалоговой формы
        begin
          TfrxEditControl(frxRLoadS35Reserv.FindObject( //Коэффициент мощности
            'edtDlgPgPowerCoefficient')).Text := '0.92';
          TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
            'dateEdtDlgPgGauging')).Date := MinDateTime; //Дата замера
          TfrxDateEditControl(frxRLoadS35Reserv.FindObject( //Обнуление времени
            'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
          TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgImax')
            ).Text := ''; //Ток, Амперы
          TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgGaugeTension')
            ).Text := ''; //Напряжение, килоВольты
        end; //else //Очистка полей диалоговой формы

      //Lbl_DlgPgShowBefore: //Метка перед вызовом диалоговой формы FastReport
      modRes := Low(Integer); //Инициализация результирующей переменной диалога
      while not ((modRes = mrOk) or (modRes = mrCancel)) do
        begin
          //ShowMessage('http://10.77.11.28:8080/browse/SUPP-31941' + #13#10 +
          //  'Выбор трансформатора на диалоговой экранной форме FastReport ' +
          //  'редактирования замеров понижающей станции 35 - 27 / 10 - 6 кВ ' +
          //  'приводит к появлению ошибки Access Violation, если присвоение ' +
          //  'диалоговой форме модального результата mrYesToAll выполнять в ' +
          //  'процедуре cmbBxDlpPgENSubst150PowerTransOnChange обработки ' +
          //  'выбора значения ниспадающего списка ' +
          //  'cmbBxDlpPgENSubst150PowerTrans класса TfrxComboBox, ' +
          //  'а не с помощью свойства ModalResult кнопки ' +
          //  'btnDlpPgENSubst150PowerTrans класса TfrxBitBtnControl.');

          //Вызов диалога для указания загрузки станции 35 - 27 / 10 - 6 кВ
          TfrxDialogPage(
            frxRLoadS35Reserv.Pages[cntPgLoadS35Reserv + 1]).ShowModal;

          modRes := TfrxDialogPage( //Присвоение результата диалога
            frxRLoadS35Reserv.Pages[cntPgLoadS35Reserv + 1]).ModalResult;

          if (modRes = mrYes) then //Связь пакета документов с Трансформатором
            begin
            end //if (modRes = mrYes) then
          else if (modRes = mrNo) then //Разрыв связи пакета и Трансформатора
            begin
            end; //else if (modRes = mrNo) then

          if (modRes = mrYesToAll) then //Заполнение режимных замеров
            begin //выборанного в списке диалоговой формы Трансформатора путём
              if vCmbBxCtrl.ItemIndex <> -1 then //повторного открытия диалога
                begin
                  //subst35PowerTransIdx  := vCmbBxCtrl.ItemIndex;
                  DMReportsENetObject.zqryEWFGauge150.Close;
                  DMReportsENetObject.zqryEWFGauge150.ParamByName(
                      'substation150refcode').AsInteger :=
                    DMReportsENetObject.codeS35;
                  DMReportsENetObject.zqryEWFGauge150.ParamByName(
                      'powertransrefcode').AsInteger :=
                    subst35PowerTransCodes[vCmbBxCtrl.ItemIndex];
                  DMReportsENetObject.zqryEWFGauge150.Open;
                  if DMReportsENetObject.zqryEWFGauge150.RecordCount > 0 then
                    begin //Передача промежуточных замеров полям диалога
                      if DMReportsENetObject.zqryEWFGauge150.FieldByName(
                        'tension').IsNull
                      then
                        TfrxEditControl(frxRLoadS35Reserv.FindObject(
                            'edtDlgPgGaugeTension')).Text := ''
                      else
                        TfrxEditControl(frxRLoadS35Reserv.FindObject(
                            'edtDlgPgGaugeTension')).Text :=
                          DMReportsENetObject.zqryEWFGauge150.FieldByName(
                            'tension').AsString;

                      if DMReportsENetObject.zqryEWFGauge150.FieldByName(
                        'current').IsNull
                      then
                        TfrxEditControl(frxRLoadS35Reserv.FindObject(
                            'edtDlgPgImax')).Text := ''
                      else
                        TfrxEditControl(frxRLoadS35Reserv.FindObject(
                            'edtDlgPgImax')).Text :=
                          DMReportsENetObject.zqryEWFGauge150.FieldByName(
                            'current').AsString;

                      if DMReportsENetObject.zqryEWFGauge150.FieldByName(
                        'dategauge').IsNull
                      then //Дата замера
                        TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
                            'dateEdtDlgPgGauging')).Date := Date
                      else
                        TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
                            'dateEdtDlgPgGauging')).DateEdit.DateTime :=
                          DMReportsENetObject.zqryEWFGauge150.FieldByName(
                            'dategauge').AsDateTime;
                      TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
                          'dateEdtDlgPgGauging')).DateEdit.Time :=
                        StrToTime('00:00:00');
                    end //if DMReportsENetObject.zqryEWFGauge150.RecordCount ...
                  else
                    begin
                      TfrxEditControl(frxRLoadS35Reserv.FindObject(
                        'edtDlgPgGaugeTension')).Text := '';
                      TfrxEditControl(frxRLoadS35Reserv.FindObject(
                        'edtDlgPgImax')).Text := ''
                    end;
                  Continue; //Переход на новую итерацию без продолжения цикла
                  //Goto Lbl_DlgPgShowBefore; //Метка - альтернатива циклу
                end; //if vCmbBxCtrlItemIndex <> -1 then
            end; //if (modRes = mrYesToAll) then

          if (modRes = mrRetry) then
            begin
              //Передача параметров запросу вызова серверной функции  удаления
              //записей таблицы Показателей уровней напряжения и силы тока на
              //клемах главных коммутационных аппаратов Трансформаторных
              //Подстанций 150 / 35 - 27 / 10 - 6 кВ, а также удаления записей
              //таблиц связей указанной выше таблицы с пакетами документов
              //подсистем ПРИСОЕДИНЕНИЕ I - IV до и после 01.08.2010,
              //c 14.03.2011, c 01.03.2013 гг. и запуск запроса
              if DMReportsENetObject.codeS35 <= 0 then
                begin
                  Application.MessageBox(
                    PChar('Не указана Понижающая Станция 35 - 27 / 10 - 6 кВ.'),
                    PChar('Внимание!'), MB_ICONWARNING);
                  Exit;
                end;
              if DMReportsENetObject.codeSubst35PowerTrans <= 0 then
                begin
                  Application.MessageBox(
                    PChar('Не указан Трансформатор 35 - 27 / 10 - 6 кВ.'),
                    PChar('Внимание!'), MB_ICONWARNING);
                  Exit;
                end;

              DMReportsENetObject.zqryEditEWFGauge150.Close;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_id_subsystem').Clear;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_id_pack').Clear; //Код пакета
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_substation150refcode' //Код Станции 35 - 27 / 10 - 6 кВ
                ).AsInteger := DMReportsENetObject.codeS35;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName( //Код 
                'p_powertransrefcode').AsInteger := //выбранного Трансформатора                  
                  subst35PowerTransCodes[vCmbBxCtrl.ItemIndex];
                  //DMReportsENetObject.codeSubst35PowerTrans;
              TfrxDateEditControl(frxRLoadS35Reserv.FindObject( //Нулевое время
                'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00'); //замера
              DMReportsENetObject.vDateGauge := TfrxDateEditControl( //Дата
                frxRLoadS35Reserv.FindObject('dateEdtDlgPgGauging')).Date;
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_dategauge'
                ).AsDate := DMReportsENetObject.vDateGauge; //Дата замера
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_current'
                ).Clear; //Показатель силы тока в промежуточной таблице, А
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_tension'
                ).Clear; //Показатель напряжения в промежуточной таблице, кВ
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName('p_userfio'
                ).Clear; //ФИО текущего пользователя
              DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                'p_isdelgauge').AsBoolean := True; 
                  //Замер из промежуточной таблицы УДАЛЯЕТСЯ, а не меняется
              DMReportsENetObject.zqryEditEWFGauge150.Open;
              DMReportsENetObject.zqryEditEWFGauge150.First;
              strMsg := DMReportsENetObject.zqryEditEWFGauge150.FieldByName(
                'edit_ewfgauge150_result').AsString;
              Application.MessageBox(
                PChar(strMsg), PChar('Внимание!'), MB_ICONINFORMATION);

              //Очистка параметров
              DMReportsENetObject.vPowerCoef := 0.92; //Коэффициент мощности
              DMReportsENetObject.vDateGauge := MinDateTime; //Дата 
              DMReportsENetObject.vGaugeTension := 0; //Напряжение, кВ
              DMReportsENetObject.vGaugeCurrent := 0; //Сила Тока, А

              //Вызов процедуры передачи через параметры показателей загрузки
              //Понижающих Трансформаторных Станций 150 / 35 - 27 / 10 - 6 кВ
              //из промежуточной таблиц комплекса EnergyWorkFlow в случае
              //отсутствия данных, совпадающих с протоколами режимных замеров,
              //в таблице комплекса EnergyNet с возможностью изменения этих
              //параметров и сохранением их в промежуточную таблицу WorkFlow
              //нужен, если после удаления замера не закрывать диалоговую форму
              //FastReport и сразу открывать печатную форму расчёта загрузки
              //DMReportsENetObject.St35TransformerQuerySetParam;

              //Очистка задающих параметры промежуточной таблицы полей диалога
              TfrxEditControl(frxRLoadS35Reserv.FindObject(   //Коэффициент
                'edtDlgPgPowerCoefficient')).Text := '0.92';  //мощности
              TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
                'dateEdtDlgPgGauging')).Date := Date; //Дата замера
              TfrxDateEditControl(frxRLoadS35Reserv.FindObject( //Нулевое время
                'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
              TfrxEditControl(frxRLoadS35Reserv.FindObject('edtDlgPgImax')
                ).Text := ''; //Ток, Амперы
              TfrxEditControl(frxRLoadS35Reserv.FindObject(
                'edtDlgPgGaugeTension')).Text := ''; //Напряжение, килоВольты
            end; //if (modRes = mrRetry) then

          if (modRes = mrRetry) or (modRes = mrOk) or (modRes = mrAll) then
            begin
              for m := Low(packIdArray) to High(packIdArray) do
                begin //Заполнение признака РЕАЛИЗОВАННОСТИ для СУЩЕСТВУЮЩИХ ТУ
                  with DMReportsENetObject.qryCntTechTerms do
                    begin
                      Close;
                      ParamByName('id_pack').AsInteger := packIdArray[m];
                      ParamByName('id_ss').AsInteger := subSystemIdArray[m];
                      Open;
                      case subSystemIdArray[m] of
                        SS_CONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsCN
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdCN;
                        SS_NEWCONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsNCN
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdNCN;
                        SS_CONNECTION_20110314:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsCN20110314
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdCN20110314;
                        SS_ELECTRICINSTALLACCESSPOWER:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsEAP
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdEAP;
                      end; //case subSystemIdArray[m] of
                    end; //with qryCntTechTerms do
                  with qryTechTermsInsOrUpd do
                    begin
                      if vChLstBxCtrl.Checked[m] then
                        ParamByName('is_realized').AsInteger := 1
                      else
                        ParamByName('is_realized').AsInteger := 0;
                      ParamByName('id_pack').AsInteger := packIdArray[m];
                      ExecSQL;
                    end; //with qryTechTermsInsOrUpd do
                end; //for m := Low(packIdArray) to High(packIdArray) do

              for m := Low(packIdRealizArray) to High(packIdRealizArray) do
                begin //Очистка признака РЕАЛИЗОВАННОСТИ для СУЩЕСТВУЮЩИХ ТУ
                  with DMReportsENetObject.qryCntTechTerms do
                    begin
                      Close;
                      ParamByName('id_pack').AsInteger := packIdRealizArray[m];
                      ParamByName('id_ss').AsInteger :=
                        subSystemIdRealizArray[m];
                      Open;
                      case subSystemIdRealizArray[m] of
                        SS_CONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsCN
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdCN;
                        SS_NEWCONNECTION:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsNCN
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdNCN;
                        SS_CONNECTION_20110314:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsCN20110314
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdCN20110314;
                        SS_ELECTRICINSTALLACCESSPOWER:
                          if FieldByName('cnt_techterms').AsInteger = 0 then
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTInsEAP
                          else
                            qryTechTermsInsOrUpd := 
                              DMReportsENetObject.qryTTUpdEAP;
                      end; //case subSystemIdRealizArray[m] of
                    end; //with qryCntTechTerms do
                  with qryTechTermsInsOrUpd do
                    begin
                      if vChLstBxCtrlRealiz.Checked[m] then
                        ParamByName('is_realized').AsInteger := 1
                      else
                        ParamByName('is_realized').AsInteger := 0;
                      ParamByName('id_pack').AsInteger := packIdRealizArray[m];
                      ExecSQL;
                    end; //with qryTechTermsInsOrUpd do
                end; //for m := Low(packIdRealizArray)
                     //to High(packIdRealizArray) do

              //Передача текстовых значений реквизитов из заполненных полей
              //диалоговой формы FastReport значениям полей печатной формы
              TfrxMemoView(frxRLoadS35Reserv.FindObject('memCalculater')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgCalculater'));
              TfrxMemoView(frxRLoadS35Reserv.FindObject('memValidater')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgValidater'));

              TfrxMemoView(frxRLoadS35Reserv.FindObject('memCalculaterPost')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgCalculaterPost'));
              TfrxMemoView(frxRLoadS35Reserv.FindObject('memValidaterPost')
                ).Memo.Text :=
                WideString(GetTextOfTfrxMemoControl('memDlgPgValidaterPost'));

              //Передача значений показателей замеров из заполненных полей
              //диалоговой формы FastReport локальным переменным этого модуля
              if (modRes = mrOk) or (modRes = mrAll) then
                begin
                  strGaugeCurrent := 
                    TfrxEditControl(frxRLoadS35Reserv.FindObject(
                      'edtDlgPgImax')).Text; //Сила тока, А
                  strGaugeTension := 
                    TfrxEditControl(frxRLoadS35Reserv.FindObject(
                      'edtDlgPgGaugeTension')).Text; //Напряжение, кВ
                  strPowerCoef := TfrxEditControl(frxRLoadS35Reserv.FindObject(
                    'edtDlgPgPowerCoefficient')).Text; //Коэффициент мощности

                  TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
                    'dateEdtDlgPgGauging')).Time := StrToTime('00:00:00');
                  if strGaugeCurrent <> '' then
                    begin
                      DMReportsENetObject.vDateGauge := //Дата замера 
                        TfrxDateEditControl(frxRLoadS35Reserv.FindObject(
                          'dateEdtDlgPgGauging')).Date;
                      if DMReportsENetObject.vDateGauge = MinDateTime then
                        DMReportsENetObject.vDateGauge := Date;
                    end
                  else
                    DMReportsENetObject.vDateGauge := Date;

                  if strGaugeCurrent <> '' then //Сила тока, А
                    DMReportsENetObject.vGaugeCurrent := 
                      StrToFloat(strGaugeCurrent);
                  if strGaugeTension <> '' then //Напряжение, кВ
                    DMReportsENetObject.vGaugeTension := 
                      StrToFloat(strGaugeTension);
                  if strPowerCoef <> '' then //Коэффициент мощности
                    DMReportsENetObject.vPowerCoef := 
                      StrToFloat(strPowerCoef);
                end; //if (modRes = mrOk) or (modRes = mrAll) then

              if (DMReportsENetObject.vGaugeCurrent > 0) //Модальному 
              and (modRes <> mrYesToAll) then //результату присваивается 
                begin //значение mrYesToAll при выборе трансформатора
                  //Передача заданных параметров в запрос вызова серверной
                  //функции оперирования записями таблицы Показателей уровней
                  //напряжения и силы тока на клемах главных коммутационных
                  //аппаратов Трансформаторов Подстанций 35 - 27 / 10 - 6 кВ,
                  //а также записями таблиц связей указанной выше таблицы с
                  //пакетами документов подсистем ПРИСОЕДИНЕНИЕ I - IV до и
                  //после 01.08.2010, c 14.03.2011, c 01.03.2013 гг.
                  //с последующим запуском запроса
                  DMReportsENetObject.zqryEditEWFGauge150.Close; 
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_id_subsystem').AsInteger := //Код подсистемы 
                    DataModuleReportsENetObject.subsystemID; 
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName( //пакет
                      'p_id_pack').AsInteger := DMReportsENetObject.packageID; 
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_substation150refcode').AsInteger := 
                    DMReportsENetObject.codeS35; //Станция 35 - 27 / 10 - 6 кВ
                  //DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                  //  'p_powertransrefcode').AsInteger := codeSubst35PowerTrans;
                  //Код выбранного в списке диаловой формы FastReport
                  //Силового Трансформатора 150 / 35 - 27 / 10 - 6 кВ
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                      'p_powertransrefcode').AsInteger :=
                    subst35PowerTransCodes[vCmbBxCtrl.ItemIndex];

                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName( 
                      'p_dategauge').AsDate := 
                    DMReportsENetObject.vDateGauge; //Дата замера
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_current').AsFloat := DMReportsENetObject.vGaugeCurrent; 
                      //Сила тока промежуточной таблице, А
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_tension').AsFloat := DMReportsENetObject.vGaugeTension; 
                      //Напряжение в промежуточной таблице, кВ
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_userfio').AsString := ''; //CURRENT_USER_FIO
                      //ФИО текущего пользователя
                  DMReportsENetObject.zqryEditEWFGauge150.ParamByName(
                    'p_isdelgauge').AsBoolean := False; //Замер РЕДАКТИРУЕТСЯ

                  if modRes = mrOk then
                    DMReportsENetObject.zqryEditEWFGauge150.ExecSQL
                  else //if modRes = mrAll then
                    begin
                      DMReportsENetObject.zqryEditEWFGauge150.Open;
                      DMReportsENetObject.zqryEditEWFGauge150.First;
                      strMsg := 
                        DMReportsENetObject.zqryEditEWFGauge150.FieldByName(
                          'edit_ewfgauge150_result').AsString;
                      Application.MessageBox(
                        PChar(strMsg), PChar('Внимание!'), MB_ICONINFORMATION);
                    end; //else //if modRes = mrAll then
                end //if (vGaugeCurrent > 0) or then //Если параметры задавались
//              else //Если параметры НЕ задавались
//                begin
//                  //Очистка параметров задействованной в отчёте
//                  //выборки Трансформаторов 35 - 27 / 10 - 6 кВ
//                  DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
//                    'gaugetension').Clear;
//                  DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
//                    'gaugecurrent').Clear;
//                  DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
//                    'powercoefficient').Clear;
//                  DMReportsENetObject.zqryLoadS35ReservENPowTrans.ParamByName(
//                    'dategauge').Clear;
//
//                  //Очистка параметров задействованной в отчёте итоговой
//                  //строковой выборки Трансформаторов 35 - 27 / 10 - 6 кВ
//                  DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
//                    'gaugetension').Clear;
//                  DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
//                    'gaugecurrent').Clear;
//                  DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
//                    'powercoefficient').Clear;
//                  DMReportsENetObject.zqryLoadS35ReservENPowTransStr.ParamByName(
//                    'dategauge').Clear;
//                end; //else //Если параметры НЕ задавались
            end; //if (modRes = mrRetry) or (modRes = mrOk) or (modRes = ...

          //if (modRes = mrCancel) then Exit
          //else
          if (modRes = mrAll) or (modRes = mrRetry) or (modRes = mrYesToAll)
          or (modRes = mrYes) or (modRes = mrNo) then
            Continue //Переход на новую итерацию без продолжения цикла
            //Goto Lbl_DlgPgShowBefore //Метка - альтернатива циклу
          else if (modRes = mrOk) then
            begin
              //Вызов процедуры передачи через параметры показателей загрузки
              //Понижающих Трансформаторных Станций 150 / 35 - 27 / 10 - 6 кВ
              //из промежуточной таблиц комплекса EnergyWorkFlow в случае
              //отсутствия данных, совпадающих с протоколами режимных замеров,
              //в таблице комплекса EnergyNet с возможностью изменения этих
              //параметров и сохранением их в промежуточную таблицу WorkFlow
              DMReportsENetObject.St35TransformerQuerySetParam;
              frxRLoadS35Reserv.ShowReport();
            end;
        end; //while not ((modRes = mrOk) or (modRes = mrCancel)) do
    end; //if (Sender.Name = 'PictureLightning') then
end; //TDMReportsENetObject.frxRLoadS35ReservClickObject(...

procedure TDMReportsENetObject.frxRLoadS35ReservClosePreview(Sender: TObject);
var strTemp, strFileName: String;
begin
  if Application.MessageBox(//Сохранение отчёта во вложениях
    PChar('Зберігти Резерв потужності во вкладеннях?'), PChar('Увага!'),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES
  then
    begin
      frxPDFExport1.DefaultPath := 'Temp\';      

      strTemp :=
        ExtractFilePath(Application.ExeName) + frxPDFExport1.DefaultPath;

      if not DirectoryExists(strTemp) then //проверка существавания паки
        CreateDir(strTemp); //и создание при необходимости
      frxPDFExport1.DefaultPath := strTemp;

      case DataModuleReportsENetObject.subsystemID of
        SS_CONNECTION:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS35ReservPackCN.FieldByName(
              's35name').AsString;
        SS_NEWCONNECTION:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS35ReservPackNCN.FieldByName(
              's35name').AsString;
        SS_CONNECTION_20110314:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS35ReservPackCN20110314.FieldByName(
              's35name').AsString;
        SS_ELECTRICINSTALLACCESSPOWER:
          frxPDFExport1.FileName := 'Резерв потужності ' +
            DMReportsENetObject.zqryLoadS35ReservPack.FieldByName(
              's35name').AsString;
      end;

      //SUPP-12460. Замена одинарных и двойных кавычек, точек, пробелов, левых
      //и правых слэшев, а также некорректно сохранённых символов в названии
      //файла на нижние подчёркивания
      strFileName := frxPDFExport1.FileName;
      strFileName := ReplaceInvalidChar(strFileName);
      if (Pos('''', strFileName) > 0) or (Pos('.', strFileName) > 0)
      or (Pos(' ', strFileName) > 0) then
        begin
          strFileName := AutoChange(strFileName, '''', '_');
          strFileName := AutoChange(strFileName, '.', '_');
          strFileName := AutoChange(strFileName, ' ', '_');
          strFileName := AutoChange(strFileName, '\', '_');
          strFileName := AutoChange(strFileName, '/', '_');
          strFileName := AutoChange(strFileName, '"', '_');
          strFileName := strFileName + '.pdf';
          frxPDFExport1.FileName := strFileName;
        end;

      //Экспорт в формате *.pdf и последующее сохранение
      frxRLoads35Reserv.Export(frxPDFExport1);

      {frmInsertDocEWF := TfrmInsertDocEWF.Create(Application, dsInsert);
      if not Assigned(DMReportsEWF) then
	      Application.CreateForm(TDMReportsEWF, DMReportsEWF);
      try
        frmInsertDocEWF.spbDocPath.Visible := False;
        frmInsertDocEWF.id_ss := DataModuleReportsENetObject.subsystemID;
        frmInsertDocEWF.id_pack := DMReportsENetObject.packageID;
        frmInsertDocEWF.id_movement := DMReportsENetObject.movementID;
        frmInsertDocEWF.id_state := DMReportsENetObject.stateID;
        frmInsertDocEWF.odDoc.InitialDir := strTemp;
        frmInsertDocEWF.edtDocPath.Text := frxPDFExport1.FileName;
        frmInsertDocEWF.id_doctype :=
          CN_DOCTYPE_RESERV_STATION_VOLTAGE_MEDIUM_35_27_10_6;
        case subsystemID of
          SS_CONNECTION: //ПРИСОЕДИНЕНИЕ I
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesCN, //Типы документов ПРИСОЕДИНЕНИЕ I до 01.08.2010 г.
                DMConnection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_DocTypesCN); //Типы документов ПРИСОЕДИНЕНИЕ I до 01.08.2010 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentCN, //Добавление вложения CN-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_InsertDocAttachmentCN, //Добавление вложения CN-пакета
                DMConnection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentCN, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentCN.sql', //Файл и директория запроса *.sql
                'queryCN\DataModuleConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleConnection.txtQRY_InsertLinkDocAttachmentCN, //Добавление ссылки к вложению
                DMConnection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes := DMConnection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMConnection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMConnection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMConnection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads35ReservPackCN.FieldByName(
                  's35name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMConnection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_CONNECTION: //ПРИСОЕДИНЕНИЕ I
          SS_NEWCONNECTION: //ПРИСОЕДИНЕНИЕ II
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesNCN, //Типы документов ПРИСОЕДИНЕНИЕ II с 01.08.2010 г.
                DMNewConnection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_DocTypesNCN); //Типы документов ПРИСОЕДИНЕНИЕ II с 01.08.2010 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentNCN, //Добавление вложения NCN-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_InsertDocAttachmentNCN, //Добавление вложения NCN-пакета
                DMNewConnection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentNCN, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentNCN.sql', //Файл и директория запроса *.sql
                'queryNCN\DataModuleNewConnection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_NCN //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleNewConnection.txtQRY_InsertLinkDocAttachmentNCN, //Добавление ссылки к вложению
                DMNewConnection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes := DMNewConnection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMNewConnection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMNewConnection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMNewConnection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads35ReservPackNCN.FieldByName(
                  's35name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMNewConnection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_NEWCONNECTION: //ПРИСОЕДИНЕНИЕ II
          SS_CONNECTION_20110314: //ПРИСОЕДИНЕНИЕ III
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesCN_20110314, //Типы документов ПРИСОЕДИНЕНИЕ III с 14.03.2011 г.
                DMCN20110314Connection.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesCN20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_DocTypesCN_20110314); //Типы документов ПРИСОЕДИНЕНИЕ III с 14.03.2011 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentCN_20110314, //Добавление CN20110314-вложения
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentCN_20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_InsertDocAttachmentCN20110314, //Добавление вложения CN20110314-пакета
                DMCN20110314Connection.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentCN20110314, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentCN20110314.sql', //Файл и директория запроса *.sql
                'queryCN20110314\DataModuleCN20110314Connection',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_CN_20110314 //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleCN20110314Connection.txtQRY_InsertLinkDocAttachmentCN20110314, //Добавление ссылки к вложению
                DMCN20110314Connection.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes :=
                DMCN20110314Connection.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMCN20110314Connection.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMCN20110314Connection.zspInsertLinkDocAttachment;
              frmInsertDocEWF.qryAttachedDocs :=
                DMCN20110314Connection.qryAttachedDocs;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads35ReservPackCN20110314.FieldByName(
                  's35name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMCN20110314Connection do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_CONNECTION_20110314: //ПРИСОЕДИНЕНИЕ III
          SS_ELECTRICINSTALLACCESSPOWER: //ПРИСОЕДИНЕНИЕ IV
            begin
              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_DocTypesEAP, //Типы документов ПРИСОЕДИНЕНИЕ IV с 01.03.2013 г.
                DMEAPElectricInstallAccessPower.qryDocTypes, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'qryDocTypesEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_DocTypesEAP); //Типы документов ПРИСОЕДИНЕНИЕ IV с 01.03.2013 г.

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertDocAttachmentEAP, //Добавление вложения EAP-пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertDocAttachmentEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_InsertDocAttachmentEAP, //Добавление вложения EAP-пакета
                DMEAPElectricInstallAccessPower.zspInsertDocAttachment);

              DMReportsEWF.LoadZQueryReportFromDataBaseOrLocalFileSytstemByID(
                QRY_InsertLinkDocAttachmentEAP, //Добавление ссылки к вложению пакета
                nil, //Запрос TZQuery
                nil, //Источник данных TfrxDBDataset
                'zspInsertLinkDocAttachmentEAP.sql', //Файл и директория запроса *.sql
                'queryEAP\DataModuleEAP',
                '', //Файл *.fr3 отчёта
                0, //WORK_QUERIES_EAP //Группа запросов
                False, //Источник запроса cn.ewfreport_query_text
                0, //Потребности в TfrxDBDataSet НЕТ
                DataModuleEAPElectricInstallAccessPower.txtQRY_InsertLinkDocAttachmentEAP, //Добавление ссылки к вложению
                DMEAPElectricInstallAccessPower.zspInsertLinkDocAttachment);

              frmInsertDocEWF.qryDocTypes :=
                DMEAPElectricInstallAccessPower.qryDocTypes;
              frmInsertDocEWF.zspInsertDocAttachment :=
                DMEAPElectricInstallAccessPower.zspInsertDocAttachment;
              frmInsertDocEWF.zspInsertLinkDocAttachment :=
                DMEAPElectricInstallAccessPower.zspInsertLinkDocAttachment;
              //frmInsertDocEWF.qryAttachedDocs :=
              //  DMEAPElectricInstallAccessPower.qryAttachedDocs;
              frmInsertDocEWF.qryAttachedDocs :=
                DMEAPElectricInstallAccessPower.qryAttachedDocsVersions;
              frmInsertDocEWF.edtDocName.Text := 'Резерв потужності ' +
                DMReportsENetObject.zqryLoads35ReservPack.FieldByName(
                  's35name').AsString;
              frmInsertDocEWF.edtDocNumber.Text :=
                IntToStr(DataModuleReportsENetObject.subsystemID) + '_' +
                IntToStr(DMReportsENetObject.packageID);
              frmInsertDocEWF.dtpDocDate.Checked := True;

              if frmInsertDocEWF.ShowModal = mrOk then
                with DMEAPElectricInstallAccessPower do
                  begin
                    qryAttachedDocsVersions.Close;
                    qryAttachedDocsVersions.ParamByName(
                      'id_pack').AsInteger := frmInsertDocEWF.id_pack;
                    qryAttachedDocsVersions.Open;
                  end;
            end; //SS_ELECTRICINSTALLACCESSPOWER: //ПРИСОЕДИНЕНИЕ IV
        end; //case subsystemID of
      finally
        frmInsertDocEWF.Free;
        DMReportsEWF.Free;
        DMReportsEWF := nil;
      end;}
    end; //if Application.MessageBox(//Сохранение отчёта во вложениях ...

  DMReportsENetObject.hLoadS35Reserv := 0; //Высвобождение отчёта из памяти
  //Уменьшение на единицу количества открытых отчётов из модуля невизуальных
  Dec(LoadReportENetObjectCount); //компонентов взаимодействия с EnergyNet
  //Если не открыто ни одного взаимодействующего с EnergyNet
  if LoadReportENetObjectCount = 0 then //отчёта из DataModuleReportsENObject
    begin //Выгрузка содержащего отчёты взаимодействия с EnergyNet
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free; //модуля невизуальных компонентов
      DMReportsENetObject := nil;
    end; //if LoadReportENetObjectCount = 0 then ...
end; //procedure TDMReportsENetObject.frxRLoadS35ReservClosePreview(...

procedure TDMReportsENetObject.frxRTechTermsQuantPowerBeforePrint(
  Sender: TfrxReportComponent);
{var i, cntENS150: Integer;
  tmpENSubstation150: ENSubstation150ControllerSoapPort;
  fENSubstation150: ENSubstation150Filter;
  lstENSubstation150: ENSubstation150ShortList;}
begin
  //Заполнение отчёта в двухуровневой системе
  {if Sender.Name = 'memE1' then
    begin
      qryENSubstation150.Close;
      qryENSubstation150.ParamByName('code_substation150').AsInteger :=
        qryTechTermsQuantPower.FieldByName('code_substation150').AsInteger;
      qryENSubstation150.Open;
    end;}

  //Заполнение отчёта в трёхуровневой системе
  {if (frxRTechTermsQuantPower.Engine.FinalPass) and not (isFullList) then
    begin
      isFullList := True;
      fENSubstation150 := ENSubstation150Filter.Create;
      SetNullIntProps(fENSubstation150);
      SetNullXSProps(fENSubstation150);
      fENSubstation150.conditionSQL := ' ENSUBSTATION150.CODE <> 0';
      for i := Low(arCodeENS150) to High(arCodeENS150) do
        if arCodeENS150[i] = 0 then
          fENSubstation150.conditionSQL := fENSubstation150.conditionSQL + #13#10 +
            ' UNION ALL SELECT 0 AS CODE, '''' AS NAME ' +
            ' , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL '
        else
          fENSubstation150.conditionSQL := fENSubstation150.conditionSQL + #13#10 +
            ' UNION ALL SELECT ENSUBSTATION150.CODE, ENSUBSTATION150.NAME ' +
            ' , NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL ' +
            ' FROM ENSUBSTATION150 WHERE ENSUBSTATION150.CODE = ' + IntToStr(arCodeENS150[i]);
      fENSubstation150.orderBySQL := '';
      tmpENSubstation150 :=
        HTTPRIOENSubstation150 as ENSubstation150ControllerSoapPort;
      lstENSubstation150 :=
        tmpENSubstation150.getScrollableFilteredListUnion(
          ENSubstation150Filter(fENSubstation150), 0, High(arCodeENS150));
      i := 0;
    end;

  if Sender.Name = 'memD1' then
    begin
      if frxRTechTermsQuantPower.Engine.FinalPass then
        begin
          //TfrxMemoView(frxRTechTermsQuantPower.FindObject('memD1')).Text := lstENSubstation150.list[i].name;
          //TfrxMemoView(Sender).Text :=
          //i := i + 1;
        end
      else
        begin
          cntENS150 := High(arCodeENS150) + 1;
          SetLength(arCodeENS150, cntENS150 + 1);
          arCodeENS150[cntENS150] :=
            qryTechTermsQuantPower.FieldByName('code_substation150').AsInteger;
        end;
    end;}
end;

procedure TDMReportsENetObject.frxRTechTermsQuantPowerClosePreview(Sender: TObject);
begin
  DMReportsENetObject.hTechTermsQuantPower := 0;
  //isFullList := False;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на единицу
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    try //Выгрузка содержащего отчёты модуля невизуальных компонентов
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free;
      DMReportsENetObject := nil;
    except
    end;
end;

procedure TDMReportsENetObject.frxRTechTermsQuantPowerDeployedClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hTechTermsQuantPowerDeployed := 0;
  //isFullList := False;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на единицу
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    try //Выгрузка содержащего отчёты модуля невизуальных компонентов
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free;
      DMReportsENetObject := nil;
    except
    end;
end;

procedure TDMReportsENetObject.frxRTechTermsQuantPowerPreview(Sender: TObject);
begin
  //SetLength(arCodeENS150, 0);
end;

procedure TDMReportsENetObject.frxRTechTermsQuantPowerSupplyClosePreview(
  Sender: TObject);
begin
  DMReportsENetObject.hTechTermsQuantPowerSupply := 0;
  //isFullList := False;
  Dec(LoadReportENetObjectCount); //Уменьшение количества открытых отчётов на единицу
  if LoadReportENetObjectCount = 0 then //Если не открыто ни одного отчёта
    try //Выгрузка содержащего отчёты модуля невизуальных компонентов
      DMReportsENetObject.sesEN.Connected := False;
      DMReportsENetObject.Free;
      DMReportsENetObject := nil;
    except
    end;
end;

procedure TDMReportsENetObject.DataModuleCreate(Sender: TObject);
begin //Инициализация переменных
  sesEN.LibraryLocation := ''; //Z:\projectsDelphi2010\DelphiEnergyNet\libpq.dll
  sesEN.Connected := False;
  SetHTTPRIOProps;
  DMReportsENetObject.hTechTermsQuantPower := 0;
  DMReportsENetObject.hTechTermsQuantPowerDeployed := 0;
  DMReportsENetObject.hTechTermsQuantPowerSupply := 0;
  DMReportsENetObject.hSouthEnergySystemPRIC594 := 0;
  DMReportsENetObject.hSubstation04Components := 0;
  DMReportsENetObject.hSubstation04Transformers := 0;
  DMReportsENetObject.hSubstation04Automats := 0;
  DMReportsENetObject.hSubstation04LinesAirCable04 := 0;
  DMReportsENetObject.hLoadS04 := 0;
  DMReportsENetObject.hLoadS04Reserv := 0;
  DMReportsENetObject.hLoadS35Reserv := 0;
  DMReportsENetObject.hLoadS150Reserv := 0;
  DMReportsENetObject.hAL04ReconstRegPRIC608 := 0;
  isExistENFiderGauge := False; //SUPP-25577. По умолчанию замеров нет

  //Инициализация промежуточных показателей замеров Силового Трансформатора
  //Высоковольтной Станции 150 / 35 - 27 / 10 - 6 кВ  для последующей их 
  //передачи параметрами в запросы расчёта загрузки трансформа и редактирования
  //в промежуточной таблице замеров EnergyWorkFlow
  DMReportsENetObject.vGaugeTension := 0; //Показатель Напряжения, кВ
  DMReportsENetObject.vGaugeCurrent := 0; //Показатель Силы Тока, А
  DMReportsENetObject.vPowerCoef := 0.92; //Коэффициент мощности
  DMReportsENetObject.vDateGauge := MinDateTime; //Дата замера

  //Промежуточные показатели замеров нагрузки трансформатора 10 - 6 / 0,4 кВ
  FiderGauge.vCurrentPhaseYellow := 0; //Ток жёлтой фазы A, Амперы
  FiderGauge.vCurrentPhaseGreen := 0; //Ток зелёной фазы B, Амперы
  FiderGauge.vCurrentPhaseRed := 0; //Ток красной фазы C, Амперы
  FiderGauge.vTensionPhaseYellow := 0; //Напряжение жёлтой фазы A, Вольты
  FiderGauge.vTensionPhaseGreen := 0; //Напряжение зелёной фазы B, Вольты
  FiderGauge.vTensionPhaseRed := 0; //Напряжение красной фазы C, Вольты
end;

procedure TDMReportsENetObject.HTTPRIOBeforeExecute(
  const MethodName: String; var SOAPRequest: WideString);
begin
{  WaitForm := WaitMessage('Внимание!',
                          'Подождите, пожалуйста' + #10#13 +
                          'Выполняется загрузка данных...');
  WaitForm.Show;
  WaitForm.Update;}

  ///// 16.03.06
  frmMain.sbMain.Panels[0].Text :=
    ' Подождите, пожалуйста!  Выполняется загрузка данных...';
  frmMain.Update;

  //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
  //  frmMain.MainMenu1.Items[i].Enabled:=false;  
  /////

  //{***}InvalidateRect(Application.MainForm.Handle,nil,true);
  //{***}Application.MainForm.Update;
  OldCursor:=Screen.Cursor;
  Screen.Cursor:=crHourGlass;
  IsRIOExecuting:=true;
  // Включить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=true;
end;

procedure TDMReportsENetObject.HTTPRIOAfterExecute(
  const MethodName: String; SOAPResponse: TStream);
var ArchiveFilePath, AppPath: String;
    tmpStream, tmpStream1: TMemoryStream;
    tmpUnZipper: TAbUnZipper;
begin
  if IsRIOExecuting then
  begin
    Screen.Cursor:=OldCursor;
{    WaitForm.Close;
    WaitForm.Free;
    WaitForm:=nil;}

    ///// 16.03.06
    frmMain.sbMain.Panels[0].Text := '';
    frmMain.Update;

    //for i:=0 to frmMain.MainMenu1.Items.Count-1 do
    //  frmMain.MainMenu1.Items[i].Enabled:=true;    
    /////

    IsRIOExecuting:=false;
  end;

  {*** 16.10.06 DL ***}
  if _IS_PACKED_RESPONSE then
  begin
    ///// ============== Распаковываем ответ сервера ==============/////

    AppPath := ExtractFilePath(Application.ExeName);
    //ArchiveFilePath := AppPath + TempReportsPath + 'tmpresponse.gz';
    ArchiveFilePath := AppPath + TempReportsPath + getFileName('tmpresponse') +
      IntToStr(GetTickCount) + '.gz';
        
    //ExtractedFilePath := AppPath + TempReportsPath + 'unknown';

    tmpStream := TMemoryStream.Create;
    try
      // Сохраняем сжатый ответ из потока во временный файл
      tmpStream.LoadFromStream(SOAPResponse);
      if not DirectoryExists(AppPath + TempReportsPath) then
        CreateDir(AppPath + TempReportsPath);
      tmpStream.SaveToFile(ArchiveFilePath);
    finally
      FreeAndNil(tmpStream);
    end;

  {  // Распаковываем ответ из временного файла
    tmpUnZipper := TAbUnZipper.Create(nil);
    try
      tmpUnZipper.BaseDirectory := AppPath + TempReportsPath;
      tmpUnZipper.FileName := ArchiveFilePath;
      tmpUnZipper.ExtractFiles('*.*');
    finally
      tmpUnZipper.Free;
    end;}

    tmpUnZipper := TAbUnZipper.Create(Self);
    try
      tmpUnZipper.BaseDirectory := AppPath + TempReportsPath;
      tmpUnZipper.FileName := ArchiveFilePath;
      //tmpUnZipper.ExtractFiles('*.*');

      tmpStream1 := TMemoryStream.Create;
      try
        // Распаковываем ответ из временного файла во временный поток
        tmpUnZipper.ExtractToStream('unknown', tmpStream1);
        // Копируем уже распаковаванный ответ обратно в исходный поток
        SOAPResponse.Position := 0;
        tmpStream1.Position := 0;
        SoapResponse.CopyFrom(tmpStream1, tmpStream1.Size);
        SoapResponse.Size := tmpStream1.Size;
        SoapResponse.Position := 0;
      finally
        FreeAndNil(tmpStream1);
      end;

    finally
      tmpUnZipper.Free;
    end;

  {  // Копируем уже распаковаванный ответ обратно в поток
    tmpStream := TMemoryStream.Create;
    try
      tmpStream.LoadFromFile(ExtractedFilePath);
      SOAPResponse.Position := 0;
      tmpStream.Position := 0;
      SoapResponse.CopyFrom(tmpStream, tmpStream.Size);
      SoapResponse.Size := tmpStream.Size;
      SoapResponse.Position := 0;
    finally
      FreeAndNil(tmpStream);
    end;}

    // Удаляем все временные файлы
    if FileExists(ArchiveFilePath) then
      SysUtils.DeleteFile(ArchiveFilePath);
  //  if FileExists(ExtractedFilePath) then
  //    DeleteFile(ExtractedFilePath);
    ///// =========================================================/////
  end;
  {*** 16.10.06 DL ***}

  // Отключить перехват окна запроса логина и пароля
  frmMain.Timer1.Enabled:=false;
end;

///// Добавляем в запрос заголовок для того, чтобы сервер сжимал ответ
{*** 16.10.06 DL ***}
procedure TDMReportsENetObject.HTTPRIOHTTPWebNodeBeforePost(
  const HTTPReqResp: THTTPReqResp; Data: Pointer);
/// 31.01.08
var TimeOut : integer;
///
begin
  if _IS_PACKED_RESPONSE then
  HttpAddRequestHeaders(HTTPReqResp.Request,
                        PChar('Accept-Encoding: gzip, deflate'),
                        Length('Accept-Encoding: gzip, deflate'),
                        HTTP_ADDREQ_FLAG_ADD);

  /// 31.01.08
  TimeOut := 10800000; // 3 часа
  InternetSetOption(Data,
                    INTERNET_OPTION_RECEIVE_TIMEOUT,
                    Pointer(@TimeOut),
                    SizeOf(TimeOut));
end;

procedure TDMReportsENetObject.SetHTTPRIOProps;
var i, p: Integer;
    IP, Port_, IniPath: String;
    //OldWSDLPath, NewWSDLPath, OldPort, OldService: String;
begin
  //Setting UserName, Password and WSDLLocation
  IniPath := ExtractFilePath(Application.ExeName) + IniName;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is THTTPRIO) then
      with THTTPRIO(Components[i]) do
      begin
        HTTPWebNode.UserName := UserName;
		    HTTPWebNode.Password := Password;
        HTTPWebNode.Agent := 'KSOE Client';

        //HTTPWebNode.UserName := 'read';
		    //HTTPWebNode.Password := 'read';

        {OldWSDLPath := WSDLLocation;
        OldService := Service;
        OldPort := Port;
        p := pos('WSDL\',OldWSDLPath);
        NewWSDLPath := ExtractFilePath(Application.ExeName)+
                     Copy(OldWSDLPath, p, Length(OldWSDLPath) - p + 1);
        WSDLLocation := NewWSDLPath;
        Service := OldService;
        Port := OldPort;}
        
        if IniValueExists(IniPath,'EnergyNet','IP') then
          IP := IniReadString(IniPath,'EnergyNet','IP')
        else
          IP := EnergyNetIP;

        if IniValueExists(IniPath,'EnergyNet','Port') then
          Port_ := IniReadString(IniPath,'EnergyNet','Port')
        else
          Port_ := EnergyNetPort;

        URL:='http://'+IP+':'+Port_+'/soap/servlet/rpcrouter';

        OnBeforeExecute := HTTPRIOBeforeExecute;
        OnAfterExecute := HTTPRIOAfterExecute;
        {*** 16.10.06 DL ***}
        HTTPWebNode.OnBeforePost := HTTPRIOHTTPWebNodeBeforePost;
        {*** 16.10.06 DL ***}
      end;
end;

//Замена фрагмента в тексте
function TDMReportsENetObject.AutoChange(s, f, n: String): String;
var p: Integer;
begin
  if (Length(f) > Length(s)) or (f = n) then //or (Length(n) = 0)
    begin
      Result := s;
      Exit;
    end;
  While Pos(f, s) <> 0 do
    begin
      p := Pos(f, s);
      s := Copy(s, 1, p - 1) + n +
        Copy(s, p + Length(f), Length(s) - p - Length(f) + 1);
    end;
  Result := s;
end;

//Исключение непечатаемых символов
function TDMReportsENetObject.ReplaceInvalidChar(const sString: String): String;
var sInvalidCharacters: array [1..64] of String; iIndex : Integer;
begin //SUPP-11809, SUPP-11847. Замена ошибочно сохранённых символов
  sInvalidCharacters[1] := '|';   //Элементы
  sInvalidCharacters[2] := ' ';   //[2, 34 - 37, 39, 47 - 52, 63] разные
  sInvalidCharacters[3] := '';   //В применении непечатаемых символов
  sInvalidCharacters[4] := '㈀';  //нет необходимости
  sInvalidCharacters[5] := '㈄';
  sInvalidCharacters[6] := '†';
  sInvalidCharacters[7] := '‡';
  sInvalidCharacters[8] := '〄';
  sInvalidCharacters[9] := 'ἄ';
  sInvalidCharacters[10] := 'ሄ';
  sInvalidCharacters[11] := 'ᨀ';
  sInvalidCharacters[12] := 'ᘀ';
  sInvalidCharacters[13] := 'ㄡ'; //Применения иероглифов не планируется
  sInvalidCharacters[14] := '嘄';
  sInvalidCharacters[15] := '圄';
  sInvalidCharacters[16] := '㐀';
  sInvalidCharacters[17] := '㐄';
  sInvalidCharacters[18] := '㔀';
  sInvalidCharacters[19] := '㔄';
  sInvalidCharacters[20] := '㜀';
  sInvalidCharacters[21] := '㠄';
  sInvalidCharacters[22] := '㨀';
  sInvalidCharacters[23] := '㨄';
  sInvalidCharacters[24] := '㴀';
  sInvalidCharacters[25] := '㴄';
  sInvalidCharacters[26] := '㸄';
  sInvalidCharacters[27] := '㼀';
  sInvalidCharacters[28] := '㼄';
  sInvalidCharacters[29] := '䀄';
  sInvalidCharacters[30] := '䄄';
  sInvalidCharacters[31] := '䈄';
  sInvalidCharacters[32] := '䌄';
  sInvalidCharacters[33] := '䤀'; //Элементы
  sInvalidCharacters[34] := '㄄';  //[2, 34 - 37, 39, 47 - 52, 63] разные
  sInvalidCharacters[35] := 'ഄ';  //[2, 34 - 37, 39, 47 - 52, 63] разные
  sInvalidCharacters[36] := 'ഀ';  //[2, 34 - 37, 39, 47 - 52, 63] разные
  sInvalidCharacters[37] := '਀';  //[2, 34 - 37, 39, 47 - 52, 63] разные

  sInvalidCharacters[38] := 'ሀ';  //SUPP-11847. Исключение специальных символов
  sInvalidCharacters[39] := 'ᤄ';
  sInvalidCharacters[3] := '传';
  sInvalidCharacters[40] := '㜄';
  sInvalidCharacters[41] := '䐄';
  sInvalidCharacters[42] := '䘄';
  sInvalidCharacters[43] := '㰄';
  sInvalidCharacters[44] := '各';
  sInvalidCharacters[45] := '　'; //Элементы массива [45, 64] - не пробелы
  sInvalidCharacters[46] := '㘄';
  sInvalidCharacters[47] := '∄';
  sInvalidCharacters[48] := 'ⴄ';
  sInvalidCharacters[49] := '㄀';
  sInvalidCharacters[50] := '⼀';
  sInvalidCharacters[51] := 'Ⰰ';
  sInvalidCharacters[52] := ' ';
  sInvalidCharacters[53] := '䌀';
  sInvalidCharacters[54] := '䔄';
  sInvalidCharacters[55] := '伄';
  sInvalidCharacters[56] := '嘀';
  sInvalidCharacters[57] := '丄';
  sInvalidCharacters[58] := '䜄';
  sInvalidCharacters[59] := '䈀';
  sInvalidCharacters[60] := '㬄';
  sInvalidCharacters[61] := '䀀';
  sInvalidCharacters[62] := '䠄'; //Элементы
  sInvalidCharacters[63] := '⤄';  //[2, 34 - 37, 39, 47 - 52, 63] разные
  sInvalidCharacters[64] := '⠀';  //Элементы массива [45, 64] - не пробелы
  Result := sString;

  for iIndex := 1 to Length(sInvalidCharacters) do
    Result := StringReplace(
      Result, sInvalidCharacters[iIndex], '', [rfReplaceAll]);

  //Избавление от двойных знаков вопроса
  Result := StringReplace(Result, '??', '?', [rfReplaceAll]);
  //Замена перехода каретки на пробел
  Result := StringReplace(Result, Chr(13), ' ', [rfReplaceAll]);
  //Избавлдение от двойных пробелов
  Result := StringReplace(Result, '  ', ' ', [rfReplaceAll]);

  //Избавление от двойного перехода каретки на следующую строку
  //Result := StringReplace(Result, Chr(13) + Chr(13), Chr(13), [rfReplaceAll]);
end; //function TDMReportsENetObject.ReplaceInvalidChar( ...

end.