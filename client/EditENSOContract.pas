
unit EditENSOContract;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSOContractController ;

type
  TfrmENSOContractEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumContractFinCol : TLabel;
    edtNumContractFinCol: TEdit;
    lblDateContractFinCol : TLabel;
    edtDateContractFinCol: TDateTimePicker;
    lblNamePartnerFinCol : TLabel;
    edtNamePartnerFinCol: TMemo;
    lblNoteContrcatFinCol : TLabel;
    edtNoteContrcatFinCol: TMemo;
    lblFinDocID : TLabel;
    edtFinDocID: TEdit;


  HTTPRIOENSOContract: THTTPRIO;

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
  frmENSOContractEdit: TfrmENSOContractEdit;
  ENSOContractObj: ENSOContract;

implementation

 uses ShowFINServicesObject, ENServicesObjectController
    ,EditFINServicesObjectFilter;

{$R *.dfm}



procedure TfrmENSOContractEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumContractFinCol
      ,edtDateContractFinCol
      ,edtNamePartnerFinCol
      ,edtNoteContrcatFinCol
      ,edtFinDocID
     ]);
     DisableControls([
       edtNumContractFinCol
      ,edtDateContractFinCol
      ,edtNamePartnerFinCol
      ,edtNoteContrcatFinCol
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSOContractObj.code);
    edtNumContractFinCol.Text := ENSOContractObj.numContractFinCol; 
    SetDateFieldForDateTimePicker(edtDateContractFinCol, ENSOContractObj.dateContractFinCol);
    MakeMultiline(edtNamePartnerFinCol.Lines, ENSOContractObj.namePartnerFinCol);
    MakeMultiline(edtNoteContrcatFinCol.Lines, ENSOContractObj.noteContrcatFinCol);
    if ( ENSOContractObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENSOContractObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;
end;

procedure TfrmENSOContractEdit.SpeedButton1Click(Sender: TObject);
var
   frmFINServicesObjectShow : TfrmFINServicesObjectShow;
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
               edtNumContractFinCol.Text := GetReturnValue(sgFINServicesObject,1);
               edtNamePartnerFinCol.Text := GetReturnValue(sgFINServicesObject,3);
               edtFinDocID.Text := GetReturnValue(sgFINServicesObject,6);
               edtNoteContrcatFinCol.Text := GetReturnValue(sgFINServicesObject,7);
               dateConract := TXSDate.Create;
               dateConract.XSToNative(GetXSDate(StrToDate(GetReturnValue(sgFINServicesObject,2))));
               SetDateFieldForDateTimePicker(edtDateContractFinCol,dateConract);
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

procedure TfrmENSOContractEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOContract: ENSOContractControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumContractFinCol
      ,edtNamePartnerFinCol
      ,edtNoteContrcatFinCol
      ,edtFinDocID
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOContract := HTTPRIOENSOContract as ENSOContractControllerSoapPort;

     ENSOContractObj.numContractFinCol := edtNumContractFinCol.Text; 
     ENSOContractObj.dateContractFinCol := GetTXSDateFromTDateTimePicker(edtDateContractFinCol);
     ENSOContractObj.namePartnerFinCol := edtNamePartnerFinCol.Text; 
     ENSOContractObj.noteContrcatFinCol := edtNoteContrcatFinCol.Text; 
     if ( edtFinDocID.Text <> '' ) then
       ENSOContractObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENSOContractObj.finDocID := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENSOContractObj.code:=low(Integer);
      TempENSOContract.add(ENSOContractObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOContract.save(ENSOContractObj);
    end;
  end;
end;


end.