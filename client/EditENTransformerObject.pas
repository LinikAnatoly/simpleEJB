
unit EditENTransformerObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransformerObjectController ;

type
  TfrmENTransformerObjectEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblBuildNumber : TLabel;
    edtBuildNumber: TEdit;
    lblBuildYear : TLabel;
    edtBuildYear: TEdit;
    lblVoltageHi : TLabel;
    edtVoltageHi1: TEdit;
    lblVoltageLow : TLabel;
    edtVoltageLow: TEdit;
    lblNomPower : TLabel;
    edtNomPower: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

  lblENTransformerTypeTransformerTypeName : TLabel;
  edtENTransformerTypeTransformerTypeName : TEdit;
  spbENTransformerTypeTransformerType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENTransformerObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtVoltageHi: TComboBox;
    spbOSSelect: TSpeedButton;
    gbObjectType: TGroupBox;
    rdbOS: TRadioButton;
    rdbMaterials: TRadioButton;
    lblGeograph: TLabel;
    edtGeograph: TEdit;
    btnGeograph: TSpeedButton;
    btnGeographClear: TSpeedButton;
    HTTPRIOENGeographicDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransformerTypeTransformerTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbOSSelectClick(Sender: TObject);
    procedure btnGeographClick(Sender: TObject);
    procedure btnGeographClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransformerObjectEdit: TfrmENTransformerObjectEdit;
  ENTransformerObjectObj: ENTransformerObject;

implementation

uses
  ShowENTransformerType
  ,ENTransformerTypeController
  ,ShowENElement
  ,ENElementController
, ShowOStable, ShowTMatherial, OSTableController, TMaterialController,
  ShowENGeographicDepartment, ENGeographicDepartmentController, ENConsts;

{uses  
    EnergyproController, EnergyproController2, ENTransformerObjectController  ;
}
{$R *.dfm}



procedure TfrmENTransformerObjectEdit.FormShow(Sender: TObject);
var
  TempENGeographicDepartment: ENGeographicDepartmentControllerSoapPort;
  ENGeographicDepartmentObj : ENGeographicDepartment;
begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtVoltageHi
      ,edtVoltageLow
      ,edtNomPower
     ]);
   end;

   DisableControls([edtBuhName , edtGeograph ]);

   if  (DialogState = dsView) then
   begin
     DisableControls([btnGeograph , btnGeographClear ]);
   end;

   if  (DialogState = dsInsert) then
   begin
      edtVoltageLow.Text := '0.4';
   end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ENTransformerObjectObj.element.geoDepartmentRef <> nil then
      if ENTransformerObjectObj.element.geoDepartmentRef.code <> LOW_INT then
       begin
        // geodept
          TempENGeographicDepartment := HTTPRIOENGeographicDepartment as ENGeographicDepartmentControllerSoapPort;
        try
          ENGeographicDepartmentObj := TempENGeographicDepartment.getObject( ENTransformerObjectObj.element.geoDepartmentRef.code );
          edtGeograph.Text := ENGeographicDepartmentObj.name;
        except
          on EConvertError do Exit;
        end;
       end;

    edtName.Text := ENTransformerObjectObj.name;
    edtBuildNumber.Text := ENTransformerObjectObj.buildNumber;
    if ( ENTransformerObjectObj.buildYear <> Low(Integer) ) then
       edtBuildYear.Text := IntToStr(ENTransformerObjectObj.buildYear)
    else
       edtBuildYear.Text := '';
    if ( ENTransformerObjectObj.voltageHi <> nil ) then
       edtVoltageHi.Text := ENTransformerObjectObj.voltageHi.decimalString
    else
       edtVoltageHi.Text := ''; 
    if ( ENTransformerObjectObj.voltageLow <> nil ) then
       edtVoltageLow.Text := ENTransformerObjectObj.voltageLow.decimalString
    else
       edtVoltageLow.Text := '';
    if ( ENTransformerObjectObj.nomPower <> nil ) then
       edtNomPower.Text := ENTransformerObjectObj.nomPower.decimalString
    else
       edtNomPower.Text := ''; 
    edtBuhName.Text := ENTransformerObjectObj.buhName; 
    edtInvNumber.Text := ENTransformerObjectObj.invNumber; 
    MakeMultiline(edtCommentGen.Lines, ENTransformerObjectObj.commentGen);

    edtENTransformerTypeTransformerTypeName.Text := ENTransformerObjectObj.transformerType.name;
    //edtENElementElementName.Text := ENTransformerObjectObj.element.name;

  end;
end;



procedure TfrmENTransformerObjectEdit.btnGeographClearClick(Sender: TObject);
begin
   ENTransformerObjectObj.element.geoDepartmentRef.code := LOW_INT;
   edtGeograph.Text := '';

end;

procedure TfrmENTransformerObjectEdit.btnGeographClick(Sender: TObject);
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
                 ENTransformerObjectObj.element.geoDepartmentRef.code := selected.code;
                 edtGeograph.Text := selected.name;
            end;
          end;
   finally
      frmENGeographicDepartmentShow.Free;
   end;
end;

procedure TfrmENTransformerObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransformerObject: ENTransformerObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtVoltageHi
      ,edtVoltageLow
      ,edtNomPower
      ,edtInvNumber
      , edtBuhName      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTransformerObject := HTTPRIOENTransformerObject as ENTransformerObjectControllerSoapPort;


     ENTransformerObjectObj.name := edtName.Text; 

     ENTransformerObjectObj.buildNumber := edtBuildNumber.Text; 

     if ( edtBuildYear.Text <> '' ) then
       ENTransformerObjectObj.buildYear := StrToInt(edtBuildYear.Text)
     else
       ENTransformerObjectObj.buildYear := Low(Integer) ;

     if (ENTransformerObjectObj.voltageHi = nil ) then
       ENTransformerObjectObj.voltageHi := TXSDecimal.Create;
     if edtVoltageHi.Text <> '' then
       ENTransformerObjectObj.voltageHi.decimalString := edtVoltageHi.Text 
     else
       ENTransformerObjectObj.voltageHi := nil;

     if (ENTransformerObjectObj.voltageLow = nil ) then
       ENTransformerObjectObj.voltageLow := TXSDecimal.Create;
     if edtVoltageLow.Text <> '' then
       ENTransformerObjectObj.voltageLow.decimalString := edtVoltageLow.Text 
     else
       ENTransformerObjectObj.voltageLow := nil;

     if (ENTransformerObjectObj.nomPower = nil ) then
       ENTransformerObjectObj.nomPower := TXSDecimal.Create;
     if edtNomPower.Text <> '' then
       ENTransformerObjectObj.nomPower.decimalString := edtNomPower.Text 
     else
       ENTransformerObjectObj.nomPower := nil;

     ENTransformerObjectObj.buhName := edtBuhName.Text; 

     ENTransformerObjectObj.invNumber := edtInvNumber.Text; 

     ENTransformerObjectObj.commentGen := edtCommentGen.Text; 

    if DialogState = dsInsert then
    begin
      ENTransformerObjectObj.code:=low(Integer);
      TempENTransformerObject.add(ENTransformerObjectObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransformerObject.save(ENTransformerObjectObj);
    end;
  end;
end;


procedure TfrmENTransformerObjectEdit.spbENTransformerTypeTransformerTypeClick(Sender : TObject);
var 
   frmENTransformerTypeShow: TfrmENTransformerTypeShow;
begin
   frmENTransformerTypeShow:=TfrmENTransformerTypeShow.Create(Application,fmNormal);
   try
      with frmENTransformerTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransformerObjectObj.transformerType = nil then ENTransformerObjectObj.transformerType := ENTransformerType.Create();
               ENTransformerObjectObj.transformerType.code := StrToInt(GetReturnValue(sgENTransformerType,0));
               edtENTransformerTypeTransformerTypeName.Text:=GetReturnValue(sgENTransformerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransformerTypeShow.Free;
   end;
end;



procedure TfrmENTransformerObjectEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransformerObjectObj.element = nil then ENTransformerObjectObj.element := ENElement.Create();
               ENTransformerObjectObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;



procedure TfrmENTransformerObjectEdit.spbOSSelectClick(Sender: TObject);
var
  frmOSTableShow: TfrmOSTableShow;
  f: OStableFilter;

  frmTMatherialShow: TfrmTMatherialShow;
  fMaterial: TMaterialFilter;
begin
  if rdbOS.Checked then // Выбор из основных
  begin
    f := OStableFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);
    f.conditionSQL := ' OSTABLE.KOD_VID in (11) '; // подстанции как СИЛ.МАШИНЫ И ОБОРУД НЕ АВТОМ (11) ...

    if length(edtInvNumber.Text) > 0 then
      f.kod_inv := '*' + edtInvNumber.Text + '*';

    f.orderBySQL :=  'OSTABLE.STR_NAME';

    frmOSTableShow:=TfrmOSTableShow.Create(Application,fmNormal,f);
    //frmOSTableShow.SendType := 444; /// для энерго ....
    try
      with frmOSTableShow do
        if ShowModal = mrOk then
        begin
          try
            //TKElementToFinCollectionObj.fincode := StrToInt(GetReturnValue(sgOSTable,0));
            edtInvNumber.Text :=  GetReturnValue(sgOSTable,2);
            edtBuhName.Text := GetReturnValue(sgOSTable,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmOSTableShow.Free;
    end;
  end
  else begin // Выбор из материалов
    fMaterial := TMaterialFilter.Create;
    SetNullIntProps(fMaterial);
    SetNullXSProps(fMaterial);

    if length(edtInvNumber.Text) > 0 then
      fMaterial.nn := '*' + edtInvNumber.Text + '*';
    fMaterial.conditionSQL := 'TMATHERIAL.STATUS = ''A''';
    fMaterial.orderBySQL :=  'TMATHERIAL.NAME';

    frmTMatherialShow := TfrmTMatherialShow.Create(Application, fmNormal, fMaterial);
    try
      with frmTMatherialShow do
        if ShowModal = mrOk then
        begin
          try
            edtInvNumber.Text := GetReturnValue(sgTMatherial,3);
            edtBuhName.Text := GetReturnValue(sgTMatherial,1);
            DisableControls([edtInvNumber, edtBuhName]);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmTMatherialShow.Free;
    end;
  end;

end;

end.