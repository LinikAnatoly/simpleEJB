
unit EditENMetrologyCounter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyCounterController ;

type
  TfrmENMetrologyCounterEdit = class(TDialogForm)

    lblInvNumber : TLabel;
    edtInvNumber: TEdit;
    lblName : TLabel;
    edtName: TMemo;
    lblBuildNumber : TLabel;
    edtBuildNumber: TEdit;
    lblAccount : TLabel;
    edtAccount: TEdit;
    lblDepartmetFKCode : TLabel;
    edtDepartmetFKCode: TEdit;
    lblMolCode : TLabel;
    edtMolCode: TEdit;
    lblDateIn : TLabel;
    edtDateIn: TDateTimePicker;
    lblDateBuild : TLabel;
    edtDateBuild: TDateTimePicker;
    lblCost : TLabel;
    edtCost: TEdit;
    lblScCode : TLabel;
    edtScCode: TEdit;
    lblCounterType : TLabel;
    edtCounterType: TEdit;

  lblENElementElementName : TLabel;
    edtENMetrologyObjectName: TEdit;
    spbENMetrologyObject: TSpeedButton;
  

  HTTPRIOENMetrologyCounter: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENMetrologyObject: THTTPRIO;
    lblPhasity: TLabel;
    edtPhasity: TEdit;
    lblZones: TLabel;
    cbZones: TComboBox;
    lblCode: TLabel;
    edtCode: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENMetrologyObjectClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMetrologyCounterEdit: TfrmENMetrologyCounterEdit;
  ENMetrologyCounterObj: ENMetrologyCounter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENMetrologyObject, ENMetrologyObjectController, ENConsts, DMReportsUnit;

{uses  
    EnergyproController, EnergyproController2, ENMetrologyCounterController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyCounterEdit.FormShow(Sender: TObject);
var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
    objFilter: ENMetrologyObjectFilter;
    ENMetrologyObjectList: ENMetrologyObjectShortList;
begin
  DMReports.SetCounterZonesForCombo(cbZones);
  DisableControls([edtCode]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtInvNumber
      ,edtName
      ,edtAccount
      ,edtDepartmetFKCode
      ,edtMolCode
      ,edtDateIn
      ,edtCost
      ,edtScCode
      ,edtENMetrologyObjectName
     ]);
   end;

  if (DialogState = dsEdit) then
  begin
    // лочим всё
    DisableControls(Self);
    // разлочиваем только то, что нужно
    DisableControls([btnOk, btnCancel, spbENMetrologyObject, edtPhasity, cbZones], false);
    DenyBlankValues([edtENMetrologyObjectName]);
  end;

  if (DialogState = dsView) then
    DisableControls([spbENMetrologyObject]);

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENMetrologyCounterObj.code);
    edtInvNumber.Text := ENMetrologyCounterObj.invNumber;
    MakeMultiline(edtName.Lines, ENMetrologyCounterObj.name);
    edtBuildNumber.Text := ENMetrologyCounterObj.buildNumber; 
    edtAccount.Text := ENMetrologyCounterObj.account; 
    edtDepartmetFKCode.Text := ENMetrologyCounterObj.departmetFKCode; 
    edtMolCode.Text := ENMetrologyCounterObj.molCode; 
      if ENMetrologyCounterObj.dateIn <> nil then
      begin
        edtDateIn.DateTime:=EncodeDate(ENMetrologyCounterObj.dateIn.Year,ENMetrologyCounterObj.dateIn.Month,ENMetrologyCounterObj.dateIn.Day);
        edtDateIn.checked := true;
      end
      else
      begin
        edtDateIn.DateTime:=SysUtils.Date;
        edtDateIn.checked := false;
      end;
      if ENMetrologyCounterObj.dateBuild <> nil then
      begin
        edtDateBuild.DateTime:=EncodeDate(ENMetrologyCounterObj.dateBuild.Year,ENMetrologyCounterObj.dateBuild.Month,ENMetrologyCounterObj.dateBuild.Day);
        edtDateBuild.checked := true;
      end
      else
      begin
        edtDateBuild.DateTime:=SysUtils.Date;
        edtDateBuild.checked := false;
      end;
    if ( ENMetrologyCounterObj.cost <> nil ) then
       edtCost.Text := ENMetrologyCounterObj.cost.decimalString
    else
       edtCost.Text := ''; 
    if ( ENMetrologyCounterObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(ENMetrologyCounterObj.scCode)
    else
       edtScCode.Text := '';
    edtCounterType.Text := ENMetrologyCounterObj.counterType;

    if(ENMetrologyCounterObj.phasity <> Low(Integer)) then begin
      edtPhasity.Text := IntToStr(ENMetrologyCounterObj.phasity);
    end else begin
      edtPhasity.Text := '';
    end;
    if(ENMetrologyCounterObj.zones <> Low(Integer)) then begin
      cbZones.ItemIndex := ENMetrologyCounterObj.zones;
    end;

    //edtENElementElementName.Text := ENMetrologyCounterObj.element.name;

    if ENMetrologyCounterObj.element <> nil then
      if ENMetrologyCounterObj.element.code <> LOW_INT then
        if ENMetrologyCounterObj.element.elementInRef <> nil then
          if ENMetrologyCounterObj.element.elementInRef.code <> LOW_INT then
          begin
            TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;

            objFilter := ENMetrologyObjectFilter.Create;
            SetNullIntProps(objFilter);
            SetNullXSProps(objFilter);

            objFilter.element := ENElement.Create;
            objFilter.element.code := ENMetrologyCounterObj.element.elementInRef.code;

            ENMetrologyObjectList := TempENMetrologyObject.getScrollableFilteredList(objFilter, 0, -1);
            if ENMetrologyObjectList <> nil then
              if High(ENMetrologyObjectList.list) > -1 then
                if ENMetrologyObjectList.list[0] <> nil then
                  edtENMetrologyObjectName.Text := ENMetrologyObjectList.list[0].name;
          end;

  end;
end;



procedure TfrmENMetrologyCounterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
begin
  if (ModalResult = mrOk) and (DialogState = dsInsert) then
  begin
    Application.MessageBox(PChar('Добавление счетчика запрещено !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
    Exit;  
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit){ or (DialogState = dsInsert)}) then
  if not NoBlankValues([
      edtInvNumber
      ,edtName
      ,edtAccount
      ,edtDepartmetFKCode
      ,edtMolCode
      ,edtCost
      ,edtScCode
      ,edtENMetrologyObjectName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else
  begin
    TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

    if(edtPhasity.Text <> '') then begin
    try
      ENMetrologyCounterObj.phasity := StrToInt(edtPhasity.Text);
    except
          on EConvertError do begin Application.MessageBox(PChar('Неправильна фазність: ' + edtPhasity.Text),PChar('Внимание !'),MB_ICONWARNING+MB_OK); Action:=caNone; Exit; end;
    end;
    end else ENMetrologyCounterObj.phasity := Low(Integer);

    if(cbZones.Text <> '') then begin
      ENMetrologyCounterObj.zones := StrToInt(cbZones.Text);
    end else ENMetrologyCounterObj.zones := Low(Integer);

     {
     ENMetrologyCounterObj.invNumber := edtInvNumber.Text; 

     ENMetrologyCounterObj.name := edtName.Text; 

     ENMetrologyCounterObj.buildNumber := edtBuildNumber.Text; 

     ENMetrologyCounterObj.account := edtAccount.Text; 

     ENMetrologyCounterObj.departmetFKCode := edtDepartmetFKCode.Text; 

     ENMetrologyCounterObj.molCode := edtMolCode.Text; 

     if edtdateIn.checked then
     begin 
       if ENMetrologyCounterObj.dateIn = nil then
          ENMetrologyCounterObj.dateIn := TXSDate.Create;
       ENMetrologyCounterObj.dateIn.XSToNative(GetXSDate(edtdateIn.DateTime));
     end
     else
       ENMetrologyCounterObj.dateIn := nil;

     if edtdateBuild.checked then
     begin 
       if ENMetrologyCounterObj.dateBuild = nil then
          ENMetrologyCounterObj.dateBuild := TXSDate.Create;
       ENMetrologyCounterObj.dateBuild.XSToNative(GetXSDate(edtdateBuild.DateTime));
     end
     else
       ENMetrologyCounterObj.dateBuild := nil;

     if (ENMetrologyCounterObj.cost = nil ) then
       ENMetrologyCounterObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       ENMetrologyCounterObj.cost.decimalString := edtCost.Text 
     else
       ENMetrologyCounterObj.cost := nil;

     if ( edtScCode.Text <> '' ) then
       ENMetrologyCounterObj.scCode := StrToInt(edtScCode.Text)
     else
       ENMetrologyCounterObj.scCode := Low(Integer) ;

     ENMetrologyCounterObj.counterType := edtCounterType.Text; 

    if DialogState = dsInsert then
    begin
      ENMetrologyCounterObj.code:=low(Integer);
      TempENMetrologyCounter.add(ENMetrologyCounterObj);
    end
    else }
    if DialogState = dsEdit then
    begin
      TempENMetrologyCounter.save(ENMetrologyCounterObj);
    end;
  end;
end;


procedure TfrmENMetrologyCounterEdit.spbENMetrologyObjectClick(Sender : TObject);
var 
  frmENMetrologyObjectShow: TfrmENMetrologyObjectShow;
  ENMetrologyObjectCode: Integer;
  TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
  ENMetrologyObj: ENMetrologyObject;
begin
  frmENMetrologyObjectShow := TfrmENMetrologyObjectShow.Create(Application, fmNormal);
  try
    with frmENMetrologyObjectShow do
      if ShowModal = mrOk then
      begin
        try
          if ENMetrologyCounterObj.element = nil then
            ENMetrologyCounterObj.element := ENElement.Create;
          if ENMetrologyCounterObj.element.elementInRef = nil then
            ENMetrologyCounterObj.element.elementInRef := ENElementRef.Create;

          ENMetrologyObjectCode := StrToInt(GetReturnValue(sgENMetrologyObject, 0));
          TempENMetrologyObject := Self.HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
          ENMetrologyObj := TempENMetrologyObject.getObject(ENMetrologyObjectCode);
          if ENMetrologyObj <> nil then
            if ENMetrologyObj.code <> LOW_INT then
              if ENMetrologyObj.element <> nil then
                ENMetrologyCounterObj.element.elementInRef.code := ENMetrologyObj.element.code;

          edtENMetrologyObjectName.Text := GetReturnValue(sgENMetrologyObject, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENMetrologyObjectShow.Free;
  end;
end;



end.