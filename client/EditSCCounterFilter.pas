
unit EditSCCounterFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCCounterController ;

type
  TfrmSCCounterFilterEdit = class(TDialogForm)

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

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmSCCounterFilterEdit: TfrmSCCounterFilterEdit;
  SCCounterFilterObj: SCCounterFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCCounterController  ;
}
{$R *.dfm}



procedure TfrmSCCounterFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtScCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

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

}

end;



procedure TfrmSCCounterFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCCounter: SCCounterControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCCounterFilterObj.invNumber := edtInvNumber.Text; 



     SCCounterFilterObj.name := edtName.Text; 



     SCCounterFilterObj.buildNumber := edtBuildNumber.Text; 



     SCCounterFilterObj.account := edtAccount.Text; 



     SCCounterFilterObj.departmetFKCode := edtDepartmetFKCode.Text; 



     SCCounterFilterObj.molCode := edtMolCode.Text; 



     if edtdateIn.checked then
     begin 
       if SCCounterFilterObj.dateIn = nil then
          SCCounterFilterObj.dateIn := TXSDate.Create;
       SCCounterFilterObj.dateIn.XSToNative(GetXSDate(edtdateIn.DateTime));
     end
     else
       SCCounterFilterObj.dateIn := nil;



     if edtdateBuild.checked then
     begin 
       if SCCounterFilterObj.dateBuild = nil then
          SCCounterFilterObj.dateBuild := TXSDate.Create;
       SCCounterFilterObj.dateBuild.XSToNative(GetXSDate(edtdateBuild.DateTime));
     end
     else
       SCCounterFilterObj.dateBuild := nil;



     if edtdateCheck.checked then
     begin 
       if SCCounterFilterObj.dateCheck = nil then
          SCCounterFilterObj.dateCheck := TXSDate.Create;
       SCCounterFilterObj.dateCheck.XSToNative(GetXSDate(edtdateCheck.DateTime));
     end
     else
       SCCounterFilterObj.dateCheck := nil;



     if (SCCounterFilterObj.cost = nil ) then
       SCCounterFilterObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       SCCounterFilterObj.cost.decimalString := edtCost.Text 
     else
       SCCounterFilterObj.cost := nil;




     if ( edtScCode.Text <> '' ) then
       SCCounterFilterObj.scCode := StrToInt(edtScCode.Text)
     else
       SCCounterFilterObj.scCode := Low(Integer) ;




     SCCounterFilterObj.counterType := edtCounterType.Text; 



     SCCounterFilterObj.installOrderNumber := edtInstallOrderNumber.Text; 



     SCCounterFilterObj.reading := edtReading.Text; 



     if edtdateEdit.checked then
     begin 
       if SCCounterFilterObj.dateEdit = nil then
          SCCounterFilterObj.dateEdit := TXSDateTime.Create;
       SCCounterFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       SCCounterFilterObj.dateEdit := nil;




  end;
end;




end.