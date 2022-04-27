
unit EditENSOContractFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOContractController ;

type
  TfrmENSOContractFilterEdit = class(TDialogForm)

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

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSOContractFilterEdit: TfrmENSOContractFilterEdit;
  ENSOContractFilterObj: ENSOContractFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOContractController  ;
}
{$R *.dfm}



procedure TfrmENSOContractFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumContractFinCol
      ,edtDateContractFinCol
      ,edtNamePartnerFinCol
      ,edtNoteContrcatFinCol
      ,edtFinDocID
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumContractFinCol.Text := ENSOContractObj.numContractFinCol; 



      if ENSOContractObj.dateContractFinCol <> nil then
      begin
        edtDateContractFinCol.DateTime:=EncodeDate(ENSOContractObj.dateContractFinCol.Year,ENSOContractObj.dateContractFinCol.Month,ENSOContractObj.dateContractFinCol.Day);
        edtDateContractFinCol.checked := true;
      end
      else
      begin
        edtDateContractFinCol.DateTime:=SysUtils.Date;
        edtDateContractFinCol.checked := false;
      end;



    MakeMultiline(edtNamePartnerFinCol.Lines, ENSOContractObj.namePartnerFinCol);



    MakeMultiline(edtNoteContrcatFinCol.Lines, ENSOContractObj.noteContrcatFinCol);



    if ( ENSOContractObj.finDocID <> Low(Integer) ) then
       edtFinDocID.Text := IntToStr(ENSOContractObj.finDocID)
    else
       edtFinDocID.Text := '';


  end;

}

end;



procedure TfrmENSOContractFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOContract: ENSOContractControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSOContractFilterObj.numContractFinCol := edtNumContractFinCol.Text; 



     if edtdateContractFinCol.checked then
     begin 
       if ENSOContractFilterObj.dateContractFinCol = nil then
          ENSOContractFilterObj.dateContractFinCol := TXSDate.Create;
       ENSOContractFilterObj.dateContractFinCol.XSToNative(GetXSDate(edtdateContractFinCol.DateTime));
     end
     else
       ENSOContractFilterObj.dateContractFinCol := nil;



     ENSOContractFilterObj.namePartnerFinCol := edtNamePartnerFinCol.Text; 



     ENSOContractFilterObj.noteContrcatFinCol := edtNoteContrcatFinCol.Text; 



     if ( edtFinDocID.Text <> '' ) then
       ENSOContractFilterObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENSOContractFilterObj.finDocID := Low(Integer) ;
	   




  end;
end;




end.