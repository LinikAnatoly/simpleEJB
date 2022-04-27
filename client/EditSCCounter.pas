
unit EditSCCounter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCCounterController ;

type
  TfrmSCCounterEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
    lblDateCheck : TLabel;
    edtDateCheck: TDateTimePicker;
    lblCost : TLabel;
    edtCost: TEdit;
    lblScCode : TLabel;
    edtScCode: TEdit;
    lblCounterType : TLabel;
    edtCounterType: TEdit;
    lblInstallOrderNumber : TLabel;
    edtInstallOrderNumber: TEdit;
    lblReading : TLabel;
    edtReading: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOSCCounter: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtPlanCode: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmSCCounterEdit: TfrmSCCounterEdit;
  SCCounterObj: SCCounter;

implementation

uses ENEstimateItemController;


{uses  
    EnergyproController, EnergyproController2, SCCounterController  ;
}
{$R *.dfm}



procedure TfrmSCCounterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtScCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(SCCounterObj.code);
    edtInvNumber.Text := SCCounterObj.invNumber; 
    MakeMultiline(edtName.Lines, SCCounterObj.name);
    edtBuildNumber.Text := SCCounterObj.buildNumber; 
    edtAccount.Text := SCCounterObj.account; 
    edtDepartmetFKCode.Text := SCCounterObj.departmetFKCode; 
    edtMolCode.Text := SCCounterObj.molCode; 
      if SCCounterObj.dateIn <> nil then
      begin
        edtDateIn.DateTime:=EncodeDate(SCCounterObj.dateIn.Year,SCCounterObj.dateIn.Month,SCCounterObj.dateIn.Day);
        edtDateIn.checked := true;
      end
      else
      begin
        edtDateIn.DateTime:=SysUtils.Date;
        edtDateIn.checked := false;
      end;
      if SCCounterObj.dateBuild <> nil then
      begin
        edtDateBuild.DateTime:=EncodeDate(SCCounterObj.dateBuild.Year,SCCounterObj.dateBuild.Month,SCCounterObj.dateBuild.Day);
        edtDateBuild.checked := true;
      end
      else
      begin
        edtDateBuild.DateTime:=SysUtils.Date;
        edtDateBuild.checked := false;
      end;
      if SCCounterObj.dateCheck <> nil then
      begin
        edtDateCheck.DateTime:=EncodeDate(SCCounterObj.dateCheck.Year,SCCounterObj.dateCheck.Month,SCCounterObj.dateCheck.Day);
        edtDateCheck.checked := true;
      end
      else
      begin
        edtDateCheck.DateTime:=SysUtils.Date;
        edtDateCheck.checked := false;
      end;
    if ( SCCounterObj.cost <> nil ) then
       edtCost.Text := SCCounterObj.cost.decimalString
    else
       edtCost.Text := ''; 
    if ( SCCounterObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCCounterObj.scCode)
    else
       edtScCode.Text := '';
    edtCounterType.Text := SCCounterObj.counterType; 
    edtInstallOrderNumber.Text := SCCounterObj.installOrderNumber; 
    edtReading.Text := SCCounterObj.reading; 
      if SCCounterObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(SCCounterObj.dateEdit.Year,SCCounterObj.dateEdit.Month,SCCounterObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmSCCounterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCCounter: SCCounterControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      //,edtScCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;


     SCCounterObj.invNumber := edtInvNumber.Text; 

     SCCounterObj.name := edtName.Text; 

     SCCounterObj.buildNumber := edtBuildNumber.Text; 

     SCCounterObj.account := edtAccount.Text; 

     SCCounterObj.departmetFKCode := edtDepartmetFKCode.Text; 

     SCCounterObj.molCode := edtMolCode.Text; 

     if edtdateIn.checked then
     begin 
       if SCCounterObj.dateIn = nil then
          SCCounterObj.dateIn := TXSDate.Create;
       SCCounterObj.dateIn.XSToNative(GetXSDate(edtdateIn.DateTime));
     end
     else
       SCCounterObj.dateIn := nil;

     if edtdateBuild.checked then
     begin 
       if SCCounterObj.dateBuild = nil then
          SCCounterObj.dateBuild := TXSDate.Create;
       SCCounterObj.dateBuild.XSToNative(GetXSDate(edtdateBuild.DateTime));
     end
     else
       SCCounterObj.dateBuild := nil;

     if edtdateCheck.checked then
     begin 
       if SCCounterObj.dateCheck = nil then
          SCCounterObj.dateCheck := TXSDate.Create;
       SCCounterObj.dateCheck.XSToNative(GetXSDate(edtdateCheck.DateTime));
     end
     else
       SCCounterObj.dateCheck := nil;

     if (SCCounterObj.cost = nil ) then
       SCCounterObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       SCCounterObj.cost.decimalString := edtCost.Text 
     else
       SCCounterObj.cost := nil;

     if ( edtScCode.Text <> '' ) then
       SCCounterObj.scCode := StrToInt(edtScCode.Text)
     else
       SCCounterObj.scCode := Low(Integer) ;

     SCCounterObj.counterType := edtCounterType.Text; 

     SCCounterObj.installOrderNumber := edtInstallOrderNumber.Text; 

     SCCounterObj.reading := edtReading.Text; 

     if edtdateEdit.checked then
     begin 
       if SCCounterObj.dateEdit = nil then
          SCCounterObj.dateEdit := TXSDateTime.Create;
       SCCounterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       SCCounterObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      SCCounterObj.code:=low(Integer);
      TempSCCounter.add(SCCounterObj);
    end
    else
    if DialogState = dsEdit then
    begin
      //TempSCCounter.save(SCCounterObj);
      SCCounterObj.estimateItemRef := ENEstimateItemRef.Create();
      SCCounterObj.estimateItemRef.code := 3;
      TempSCCounter.installCounter(StrToInt(edtPlanCode.Text), 75001303, -1, SCCounterObj);
      //TempSCCounter.undoInstallCounter(SCCounterObj)  ;
    end;
  end;
end;


end.