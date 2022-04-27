
unit EditENNormVolumeAVZItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENNormVolumeAVZItemController ;

type
  TfrmENNormVolumeAVZItemFilterEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENNormVolumeAVZItem: THTTPRIO;

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
  frmENNormVolumeAVZItemFilterEdit: TfrmENNormVolumeAVZItemFilterEdit;
  ENNormVolumeAVZItemFilterObj: ENNormVolumeAVZItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENNormVolumeAVZItemController  ;
}
{$R *.dfm}



procedure TfrmENNormVolumeAVZItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCountGen
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENNormVolumeAVZItemObj.countGen <> nil ) then
       edtCountGen.Text := ENNormVolumeAVZItemObj.countGen.decimalString
    else
       edtCountGen.Text := ''; 



    edtUserGen.Text := ENNormVolumeAVZItemObj.userGen; 



      if ENNormVolumeAVZItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENNormVolumeAVZItemObj.dateEdit.Year,ENNormVolumeAVZItemObj.dateEdit.Month,ENNormVolumeAVZItemObj.dateEdit.Day);
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



procedure TfrmENNormVolumeAVZItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     if (ENNormVolumeAVZItemFilterObj.countGen = nil ) then
       ENNormVolumeAVZItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENNormVolumeAVZItemFilterObj.countGen.decimalString := edtCountGen.Text 
     else
       ENNormVolumeAVZItemFilterObj.countGen := nil;

     ENNormVolumeAVZItemFilterObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin 
       if ENNormVolumeAVZItemFilterObj.dateEdit = nil then
          ENNormVolumeAVZItemFilterObj.dateEdit := TXSDateTime.Create;
       ENNormVolumeAVZItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENNormVolumeAVZItemFilterObj.dateEdit := nil;
  end;
end;




end.