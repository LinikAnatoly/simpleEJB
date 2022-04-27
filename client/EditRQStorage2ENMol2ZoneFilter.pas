
unit EditRQStorage2ENMol2ZoneFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorage2ENMol2ZoneController ;

type
  TfrmRQStorage2ENMol2ZoneFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQStorage2ENMol2Zone: THTTPRIO;

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
  frmRQStorage2ENMol2ZoneFilterEdit: TfrmRQStorage2ENMol2ZoneFilterEdit;
  RQStorage2ENMol2ZoneFilterObj: RQStorage2ENMol2ZoneFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQStorage2ENMol2ZoneController  ;
}
{$R *.dfm}



procedure TfrmRQStorage2ENMol2ZoneFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := RQStorage2ENMol2ZoneObj.userGen; 



      if RQStorage2ENMol2ZoneObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorage2ENMol2ZoneObj.dateEdit.Year,RQStorage2ENMol2ZoneObj.dateEdit.Month,RQStorage2ENMol2ZoneObj.dateEdit.Day);
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



procedure TfrmRQStorage2ENMol2ZoneFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorage2ENMol2Zone: RQStorage2ENMol2ZoneControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQStorage2ENMol2ZoneFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQStorage2ENMol2ZoneFilterObj.dateEdit = nil then
          RQStorage2ENMol2ZoneFilterObj.dateEdit := TXSDateTime.Create;
       RQStorage2ENMol2ZoneFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQStorage2ENMol2ZoneFilterObj.dateEdit := nil;




  end;
end;




end.