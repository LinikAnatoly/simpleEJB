
unit EditENMetrologyCounterFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyCounterController ;

type
  TfrmENMetrologyCounterFilterEdit = class(TDialogForm)
  

  HTTPRIOENMetrologyCounter: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblInvNumber: TLabel;
    lblName: TLabel;
    lblBuildNumber: TLabel;
    lblAccount: TLabel;
    lblDepartmetFKCode: TLabel;
    lblMolCode: TLabel;
    lblDateIn: TLabel;
    lblDateBuild: TLabel;
    lblCost: TLabel;
    lblScCode: TLabel;
    lblCounterType: TLabel;
    spbENMetrologyObject: TSpeedButton;
    lblENElementElementName: TLabel;
    edtInvNumber: TEdit;
    edtBuildNumber: TEdit;
    edtAccount: TEdit;
    edtDepartmetFKCode: TEdit;
    edtMolCode: TEdit;
    edtDateIn: TDateTimePicker;
    edtDateBuild: TDateTimePicker;
    edtCost: TEdit;
    edtScCode: TEdit;
    edtCounterType: TEdit;
    edtENMetrologyObjectName: TEdit;
    HTTPRIO1: THTTPRIO;
    HTTPRIOENMetrologyObject: THTTPRIO;
    edtName: TEdit;
    edtPhasity: TEdit;
    lblPhasity: TLabel;
    Label1: TLabel;
    cbZones: TComboBox;
    lblTKAccountingType: TLabel;
    cbTKAccountingType: TComboBox;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENMetrologyObjectClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMetrologyCounterFilterEdit: TfrmENMetrologyCounterFilterEdit;
  ENMetrologyCounterFilterObj: ENMetrologyCounterFilter;

implementation

uses
  ShowENElement
  ,ENElementController
, ShowENMetrologyCounter, ENMetrologyObjectController,
  ShowENMetrologyObject, ENConsts, DMReportsUnit
  , TKAccountingTypeController;

{uses  
    EnergyproController, EnergyproController2, ENMetrologyCounterController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyCounterFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtENMetrologyObjectName]);
  SetFloatStyle(edtCost);
  SetIntStyle(edtScCode);
  DMReports.SetCounterZonesForCombo(cbZones);

{ пока ниче не делать ...

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
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtInvNumber.Text := ENMetrologyCounterObj.invNumber; 



    edtName.Text := ENMetrologyCounterObj.name; 



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


  end;

}

end;



procedure TfrmENMetrologyCounterFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
tempInt : Integer;
begin
  if (ModalResult = mrOk)  then
  begin
     ENMetrologyCounterFilterObj.invNumber := edtInvNumber.Text;
     ENMetrologyCounterFilterObj.name := edtName.Text;
     ENMetrologyCounterFilterObj.buildNumber := edtBuildNumber.Text;
     ENMetrologyCounterFilterObj.account := edtAccount.Text;
     ENMetrologyCounterFilterObj.departmetFKCode := edtDepartmetFKCode.Text;
     ENMetrologyCounterFilterObj.molCode := edtMolCode.Text;

     if edtdateIn.Checked then
     begin
       if ENMetrologyCounterFilterObj.dateIn = nil then
         ENMetrologyCounterFilterObj.dateIn := TXSDate.Create;
       ENMetrologyCounterFilterObj.dateIn.XSToNative(GetXSDate(edtdateIn.DateTime));
     end
     else
       ENMetrologyCounterFilterObj.dateIn := nil;

     if edtdateBuild.Checked then
     begin
       if ENMetrologyCounterFilterObj.dateBuild = nil then
         ENMetrologyCounterFilterObj.dateBuild := TXSDate.Create;
       ENMetrologyCounterFilterObj.dateBuild.XSToNative(GetXSDate(edtdateBuild.DateTime));
     end;

     if edtCost.Text <> '' then
     begin
       if (ENMetrologyCounterFilterObj.cost = nil) then
         ENMetrologyCounterFilterObj.cost := TXSDecimal.Create;
       ENMetrologyCounterFilterObj.cost.DecimalString := edtCost.Text;
     end
     else
       ENMetrologyCounterFilterObj.cost := nil;

      if edtPhasity.Text <> '' then begin
      tempInt := Low(Integer);
      try
        tempInt := StrToInt(edtPhasity.Text);
      except
          on EConvertError do Exit;
      end;
      ENMetrologyCounterFilterObj.phasity := tempInt;
      end;

      if cbZones.Text <> '' then begin
        ENMetrologyCounterFilterObj.zones := StrToInt(cbZones.Text);
      end;

     if (edtScCode.Text <> '') then
       ENMetrologyCounterFilterObj.scCode := StrToInt(edtScCode.Text)
     else
       ENMetrologyCounterFilterObj.scCode := Low(Integer);

     ENMetrologyCounterFilterObj.counterType := edtCounterType.Text;

     if Length(Trim(cbTKAccountingType.Text)) > 0 then begin
       ENMetrologyCounterFilterObj.accountingTypeRef := TKAccountingTypeRef.Create;
       ENMetrologyCounterFilterObj.accountingTypeRef.code := cbTKAccountingType.ItemIndex + 1;
     end;
  end;
end;

procedure TfrmENMetrologyCounterFilterEdit.spbENMetrologyObjectClick(
  Sender: TObject);
var 
  frmENMetrologyObjectShow: TfrmENMetrologyObjectShow;
  ENMetrologyObjectCode: Integer;
  TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
  ENMetrologyObj: ENMetrologyObject;
  condition: String;
begin
  frmENMetrologyObjectShow := TfrmENMetrologyObjectShow.Create(Application, fmNormal);
  try
    with frmENMetrologyObjectShow do
      if ShowModal = mrOk then
      begin
        try
          {if ENMetrologyCounterFilterObj.element = nil then
            ENMetrologyCounterFilterObj.element := ENElement.Create;
          if ENMetrologyCounterFilterObj.element.elementInRef = nil then
            ENMetrologyCounterFilterObj.element.elementInRef := ENElementRef.Create;

          SetNullIntProps(ENMetrologyCounterFilterObj.element);
          SetNullXSProps(ENMetrologyCounterFilterObj.element);}

          condition := ENMetrologyCounterFilterObj.conditionSQL;

          ENMetrologyObjectCode := StrToInt(GetReturnValue(sgENMetrologyObject, 0));
          TempENMetrologyObject := Self.HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
          ENMetrologyObj := TempENMetrologyObject.getObject(ENMetrologyObjectCode);
          if ENMetrologyObj <> nil then
            if ENMetrologyObj.code <> LOW_INT then
              if ENMetrologyObj.element <> nil then
              begin
                //ENMetrologyCounterFilterObj.element.elementInRef.code := ENMetrologyObj.element.code;
                AddCondition(condition,
                             'enmetrologycounter.elementcode in ' +
                             '  (select e.code from enelement e where e.elementinrefcode = ' +
                             IntToStr(ENMetrologyObj.element.code) + ') ');
                ENMetrologyCounterFilterObj.conditionSQL := condition;
              end;

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
