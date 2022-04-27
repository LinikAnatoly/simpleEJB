
unit EditRQStorage2ENMolFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorage2ENMolController ;

type
  TfrmRQStorage2ENMolFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQStorage2ENMol: THTTPRIO;

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
  frmRQStorage2ENMolFilterEdit: TfrmRQStorage2ENMolFilterEdit;
  RQStorage2ENMolFilterObj: RQStorage2ENMolFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQStorage2ENMolController  ;
}
{$R *.dfm}



procedure TfrmRQStorage2ENMolFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := RQStorage2ENMolObj.userGen; 



      if RQStorage2ENMolObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorage2ENMolObj.dateEdit.Year,RQStorage2ENMolObj.dateEdit.Month,RQStorage2ENMolObj.dateEdit.Day);
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



procedure TfrmRQStorage2ENMolFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorage2ENMol: RQStorage2ENMolControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQStorage2ENMolFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQStorage2ENMolFilterObj.dateEdit = nil then
          RQStorage2ENMolFilterObj.dateEdit := TXSDateTime.Create;
       RQStorage2ENMolFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQStorage2ENMolFilterObj.dateEdit := nil;




  end;
end;




end.