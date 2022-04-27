
unit EditENSOLeaseAgreement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSOLeaseAgreementController ;

type
  TfrmENSOLeaseAgreementEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumContract : TLabel;
    edtNumContract: TEdit;
    lblDateContract : TLabel;
    edtDateContract: TDateTimePicker;
    lblNamePartner : TLabel;
    edtNamePartner: TMemo;
    lblFinDocID : TLabel;
    edtFinDocID: TEdit;


  HTTPRIOENSOLeaseAgreement: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    SpeedButton1: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSOLeaseAgreementEdit: TfrmENSOLeaseAgreementEdit;
  ENSOLeaseAgreementObj: ENSOLeaseAgreement;

implementation

 uses ShowFINServicesObject, ENServicesObjectController
    ,EditFINServicesObjectFilter;

{$R *.dfm}



procedure TfrmENSOLeaseAgreementEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumContract
      ,edtDateContract
      ,edtNamePartner
      ,edtFinDocID
     ]);
     DisableControls([edtCode, edtNumContract
      ,edtDateContract
      ,edtNamePartner
      ,edtFinDocID]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSOLeaseAgreementObj.code);
    edtNumContract.Text := ENSOLeaseAgreementObj.numContract; 
    SetDateFieldForDateTimePicker(edtDateContract, ENSOLeaseAgreementObj.dateContract);
    MakeMultiline(edtNamePartner.Lines, ENSOLeaseAgreementObj.namePartner);
    if ( ENSOLeaseAgreementObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENSOLeaseAgreementObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;
end;



procedure TfrmENSOLeaseAgreementEdit.SpeedButton1Click(Sender: TObject);
var
   frmFINServicesObjectShow : TfrmFINServicesObjectShow;
   tempDateConract : TDateTime;
   dateConract : TXSDate;
begin

 // if not Assigned(frmFINServicesObjectShow) then
    ENServicesObjectFilterObj := ENServicesObjectFilter.Create();

  SetNullXSProps(ENServicesObjectFilterObj);
  SetNullIntProps(ENServicesObjectFilterObj);

  ENServicesObjectFilterObj.conditionSQL := 'a.id = -1';

  frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application, fmNormal, ENServicesObjectFilterObj);

   try
      with frmFINServicesObjectShow do begin

        if ShowModal = mrOk then
        begin
            try
               edtNumContract.Text := GetReturnValue(sgFINServicesObject,1);
               edtNamePartner.Text := GetReturnValue(sgFINServicesObject,3);
               edtFinDocID.Text := GetReturnValue(sgFINServicesObject,6);
               //tempDateConract := StrToDate(GetReturnValue(sgFINServicesObject,2));
               dateConract := TXSDate.Create;
               dateConract.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject,2))));
               SetDateFieldForDateTimePicker(edtDateContract,dateConract);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINServicesObjectShow.Free;
      frmFINServicesObjectShow := nil;
   end;
end;

procedure TfrmENSOLeaseAgreementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOLeaseAgreement: ENSOLeaseAgreementControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumContract
      ,edtNamePartner
      ,edtFinDocID
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOLeaseAgreement := HTTPRIOENSOLeaseAgreement as ENSOLeaseAgreementControllerSoapPort;

     ENSOLeaseAgreementObj.numContract := edtNumContract.Text; 
     ENSOLeaseAgreementObj.dateContract := GetTXSDateFromTDateTimePicker(edtDateContract);
     ENSOLeaseAgreementObj.namePartner := edtNamePartner.Text; 
     if ( edtFinDocID.Text <> '' ) then
       ENSOLeaseAgreementObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENSOLeaseAgreementObj.finDocID := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENSOLeaseAgreementObj.code:=low(Integer);
      TempENSOLeaseAgreement.add(ENSOLeaseAgreementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOLeaseAgreement.save(ENSOLeaseAgreementObj);
    end;
  end;
end;


end.