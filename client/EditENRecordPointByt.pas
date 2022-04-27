unit EditENRecordPointByt;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENRecordPointBytController ;

type
  TfrmENRecordPointBytEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;
    lblContractDate : TLabel;
    edtContractDate: TDateTimePicker;
    lblName : TLabel;
    edtName: TEdit;
    lblAddress : TLabel;
    edtAddress: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblRpCode : TLabel;
    edtRpCode: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblSerialNumber : TLabel;
    edtSerialNumber: TEdit;
    lblDateCounterInst : TLabel;
    edtDateCounterInst: TDateTimePicker;
    lblDateCounterCheck : TLabel;
    edtDateCounterCheck: TDateTimePicker;
    lblCounterType : TLabel;
    edtCounterType: TEdit;
    lblStatuscode : TLabel;
    edtStatuscode: TEdit;
    lblPhasity : TLabel;
    edtPhasity: TEdit;
    lblDatecheck : TLabel;
    edtDatecheck: TDateTimePicker;
    lblCheckperiod1 : TLabel;
    edtCheckperiod1: TEdit;
    lblPhone : TLabel;
    edtPhone: TEdit;
    lblSeal : TLabel;
    edtSeal: TEdit;
    lblPlacecounter : TLabel;
    edtPlacecounter: TEdit;
    lblIsworking : TLabel;
    edtIsworking: TEdit;
    lblCounterCapacity : TLabel;
    edtCounterCapacity: TEdit;
    lblCounterVoltageNominal : TLabel;
    edtCounterVoltageNominal: TEdit;
    lblCounterDateProduct : TLabel;
    edtCounterDateProduct: TDateTimePicker;
    lblAreaType : TLabel;
    edtAreaType: TEdit;
    lblFiderCode : TLabel;
    edtFiderCode: TEdit;
    lblFiderName : TLabel;
    edtFiderName: TMemo;
    lblCodeEIC : TLabel;
    edtCodeEIC: TEdit;
    lblTower : TLabel;
    edtTower: TEdit;
    lblFeeder04 : TLabel;
    edtFeeder04: TMemo;
    lblDateFirstConsumption : TLabel;
    edtDateFirstConsumption: TDateTimePicker;
    lblPrevCheckPeriod : TLabel;
    edtPrevCheckPeriod: TDateTimePicker;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

    HTTPRIOENRecordPointByt: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblCheckperiod: TLabel;
    edtCheckperiod: TEdit;
    chkDisablePlan: TCheckBox;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENRecordPointBytEdit: TfrmENRecordPointBytEdit;
  ENRecordPointBytObj: ENRecordPointByt;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;


{$R *.dfm}

procedure TfrmENRecordPointBytEdit.FormShow(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  DisableControls([edtCode , edtGeograph ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENElementElementName
      ,spbENElementElement
      , btnGeograph , btnGeographClear  ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtAccountNumber
      ,edtName
      ,edtRpCode
      ,edtDateCounterInst
      ,edtDateCounterCheck
      ,edtCheckperiod
      ,edtStatuscode
      ,edtPhasity
      ,edtDatecheck
      ,edtCheckperiod1
      ,edtPlacecounter
      ,edtIsworking
      ,edtCounterCapacity
      ,edtCounterVoltageNominal
      ,edtCounterDateProduct
      ,edtTower
      ,edtFeeder04
      ,edtPrevCheckPeriod
      ,edtRpCode
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin


    if ENRecordPointBytObj.element.geoDepartmentRef <> nil then
      if ENRecordPointBytObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
            // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENRecordPointBytObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

     if ENRecordPointBytObj.disablePlan >= 1 then
        chkDisablePlan.Checked:= True
        else
        chkDisablePlan.Checked:= false;

    edtCode.Text := IntToStr(ENRecordPointBytObj.code);
    edtAccountNumber.Text := ENRecordPointBytObj.accountNumber; 
    SetDateFieldForDateTimePicker(edtContractDate, ENRecordPointBytObj.contractDate);
    edtName.Text := ENRecordPointBytObj.name; 
    edtAddress.Text := ENRecordPointBytObj.address; 
    MakeMultiline(edtCommentGen.Lines, ENRecordPointBytObj.commentGen);
    if ( ENRecordPointBytObj.rpCode <> Low(Integer) ) then
       edtRpCode.Text := IntToStr(ENRecordPointBytObj.rpCode)
    else
       edtRpCode.Text := '';
    edtInvNumber.Text := ENRecordPointBytObj.invNumber; 
    edtSerialNumber.Text := ENRecordPointBytObj.serialNumber; 
    SetDateFieldForDateTimePicker(edtDateCounterInst, ENRecordPointBytObj.dateCounterInst);
    SetDateFieldForDateTimePicker(edtDateCounterCheck, ENRecordPointBytObj.dateCounterCheck);
    edtCounterType.Text := ENRecordPointBytObj.counterType; 

    SetTXSDecimalForTEdit(edtCheckperiod, ENRecordPointBytObj.checkperiod);
    if ( ENRecordPointBytObj.statuscode <> Low(Integer) ) then
       edtStatuscode.Text := IntToStr(ENRecordPointBytObj.statuscode)
    else
       edtStatuscode.Text := '';
    SetTXSDecimalForTEdit(edtPhasity, ENRecordPointBytObj.phasity);
    SetDateFieldForDateTimePicker(edtDatecheck, ENRecordPointBytObj.datecheck);
    SetTXSDecimalForTEdit(edtCheckperiod1, ENRecordPointBytObj.checkperiod1);
    edtPhone.Text := ENRecordPointBytObj.phone; 
    edtSeal.Text := ENRecordPointBytObj.seal; 
    edtPlacecounter.Text := ENRecordPointBytObj.placecounter; 
    if ( ENRecordPointBytObj.isworking <> Low(Integer) ) then
       edtIsworking.Text := IntToStr(ENRecordPointBytObj.isworking)
    else
       edtIsworking.Text := '';
    if ( ENRecordPointBytObj.counterCapacity <> Low(Integer) ) then
       edtCounterCapacity.Text := IntToStr(ENRecordPointBytObj.counterCapacity)
    else
       edtCounterCapacity.Text := '';
    SetTXSDecimalForTEdit(edtCounterVoltageNominal, ENRecordPointBytObj.counterVoltageNominal);
    SetDateFieldForDateTimePicker(edtCounterDateProduct, ENRecordPointBytObj.counterDateProduct);
    if ( ENRecordPointBytObj.areaType <> Low(Integer) ) then
       edtAreaType.Text := IntToStr(ENRecordPointBytObj.areaType)
    else
       edtAreaType.Text := '';
    if ( ENRecordPointBytObj.fiderCode <> Low(Integer) ) then
       edtFiderCode.Text := IntToStr(ENRecordPointBytObj.fiderCode)
    else
       edtFiderCode.Text := '';
    MakeMultiline(edtFiderName.Lines, ENRecordPointBytObj.fiderName);

    edtCodeEIC.Text := ENRecordPointBytObj.codeEIC; 
    edtTower.Text := ENRecordPointBytObj.tower; 
    MakeMultiline(edtFeeder04.Lines, ENRecordPointBytObj.feeder04);
    SetDateFieldForDateTimePicker(edtDateFirstConsumption, ENRecordPointBytObj.dateFirstConsumption);

    if ( ENRecordPointBytObj.rpCode <> Low(Integer) ) then
       edtRpCode.Text := IntToStr(ENRecordPointBytObj.rpCode)
    else
       edtRpCode.Text := '';

   // edtENElementElementName.Text := ENRecordPointBytObj.element.name;
  end;
end;



procedure TfrmENRecordPointBytEdit.btnGeographClearClick(Sender: TObject);
begin
  ENRecordPointBytObj.element.geoDepartmentRef.code := LOW_INT;
  edtGeograph.Text := '';

end;

procedure TfrmENRecordPointBytEdit.btnGeographClick(Sender: TObject);
var
   frmENGeographicDepartmentShow: TfrmENGeographicDepartmentShow;
   Filter : ENGeographicDepartmentFilter;
   selected : ENGeographicDepartmentShort;
begin
  Filter := ENGeographicDepartmentFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);


  frmENGeographicDepartmentShow := TfrmENGeographicDepartmentShow.Create(Application, fmNormal, Filter);
  try
      with frmENGeographicDepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENGeographicDepartmentShort(sgENGeographicDepartment.Objects[0, sgENGeographicDepartment.Row]);
                except
                   on EConvertError do begin  Exit; end;
                end;
                 ENRecordPointBytObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENRecordPointBytEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRecordPointByt: ENRecordPointBytControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtAccountNumber
      ,edtName
      ,edtRpCode

      ,edtCheckperiod
      ,edtStatuscode
      ,edtPhasity
      ,edtCheckperiod1
      ,edtPlacecounter
      ,edtIsworking
      ,edtCounterCapacity
      ,edtCounterVoltageNominal

      ,edtTower
      ,edtFeeder04
      ,edtRpCode
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;

    ENRecordPointBytObj.accountNumber := edtAccountNumber.Text; 
    ENRecordPointBytObj.contractDate := GetTXSDateFromTDateTimePicker(edtContractDate);
    ENRecordPointBytObj.name := edtName.Text; 
    ENRecordPointBytObj.address := edtAddress.Text; 
    ENRecordPointBytObj.commentGen := edtCommentGen.Text; 
    if ( edtRpCode.Text <> '' ) then
      ENRecordPointBytObj.rpCode := StrToInt(edtRpCode.Text)
    else
      ENRecordPointBytObj.rpCode := Low(Integer);
    ENRecordPointBytObj.invNumber := edtInvNumber.Text; 
    ENRecordPointBytObj.serialNumber := edtSerialNumber.Text; 
    ENRecordPointBytObj.dateCounterInst := GetTXSDateFromTDateTimePicker(edtDateCounterInst);
    ENRecordPointBytObj.dateCounterCheck := GetTXSDateFromTDateTimePicker(edtDateCounterCheck);
    ENRecordPointBytObj.counterType := edtCounterType.Text; 

    ENRecordPointBytObj.checkperiod := GetTXSDecimalFromTEdit(edtCheckperiod);
    if ( edtStatuscode.Text <> '' ) then
      ENRecordPointBytObj.statuscode := StrToInt(edtStatuscode.Text)
    else
      ENRecordPointBytObj.statuscode := Low(Integer);
    ENRecordPointBytObj.phasity := GetTXSDecimalFromTEdit(edtPhasity);
    ENRecordPointBytObj.datecheck := GetTXSDateFromTDateTimePicker(edtDatecheck);
    ENRecordPointBytObj.checkperiod1 := GetTXSDecimalFromTEdit(edtCheckperiod1);
    ENRecordPointBytObj.phone := edtPhone.Text; 
    ENRecordPointBytObj.seal := edtSeal.Text; 
    ENRecordPointBytObj.placecounter := edtPlacecounter.Text; 
    if ( edtIsworking.Text <> '' ) then
      ENRecordPointBytObj.isworking := StrToInt(edtIsworking.Text)
    else
      ENRecordPointBytObj.isworking := Low(Integer);
    if ( edtCounterCapacity.Text <> '' ) then
      ENRecordPointBytObj.counterCapacity := StrToInt(edtCounterCapacity.Text)
    else
      ENRecordPointBytObj.counterCapacity := Low(Integer);
    ENRecordPointBytObj.counterVoltageNominal := GetTXSDecimalFromTEdit(edtCounterVoltageNominal);
    ENRecordPointBytObj.counterDateProduct := GetTXSDateFromTDateTimePicker(edtCounterDateProduct);
    if ( edtAreaType.Text <> '' ) then
      ENRecordPointBytObj.areaType := StrToInt(edtAreaType.Text)
    else
      ENRecordPointBytObj.areaType := Low(Integer);
    if ( edtFiderCode.Text <> '' ) then
      ENRecordPointBytObj.fiderCode := StrToInt(edtFiderCode.Text)
    else
      ENRecordPointBytObj.fiderCode := Low(Integer);
    ENRecordPointBytObj.fiderName := edtFiderName.Text; 

    ENRecordPointBytObj.codeEIC := edtCodeEIC.Text;
    ENRecordPointBytObj.tower := edtTower.Text; 
    ENRecordPointBytObj.feeder04 := edtFeeder04.Text;
    ENRecordPointBytObj.dateFirstConsumption := GetTXSDateFromTDateTimePicker(edtDateFirstConsumption);
    // ENRecordPointBytObj.prevCheckPeriod := GetTXSDateFromTDateTimePicker(edtPrevCheckPeriod);
    if ( edtRpCode.Text <> '' ) then
      ENRecordPointBytObj.rpCode := StrToInt(edtRpCode.Text)
    else
      ENRecordPointBytObj.rpCode := Low(Integer);

    if chkDisablePlan.Checked then
        ENRecordPointBytObj.disablePlan := 1
        else
        ENRecordPointBytObj.disablePlan := 0;

    if DialogState = dsInsert then
    begin
      ENRecordPointBytObj.code := Low(Integer);
      TempENRecordPointByt.add(ENRecordPointBytObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENRecordPointByt.save(ENRecordPointBytObj);
    end;
  end;
end;


procedure TfrmENRecordPointBytEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENRecordPointBytObj.element = nil then ENRecordPointBytObj.element := ENElement.Create();
               ENRecordPointBytObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


end.