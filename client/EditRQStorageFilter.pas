
unit EditRQStorageFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorageController ;

type
  TfrmRQStorageFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblShortName : TLabel;
    edtShortName: TEdit;

    lblDescription : TLabel;
    edtDescription: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQStorage: THTTPRIO;

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
  frmRQStorageFilterEdit: TfrmRQStorageFilterEdit;
  RQStorageFilterObj: RQStorageFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQStorageController  ;
}
{$R *.dfm}



procedure TfrmRQStorageFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtShortName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQStorageObj.name; 



    edtShortName.Text := RQStorageObj.shortName; 



    MakeMultiline(edtDescription.Lines, RQStorageObj.description);



    edtUserGen.Text := RQStorageObj.userGen; 



      if RQStorageObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorageObj.dateEdit.Year,RQStorageObj.dateEdit.Month,RQStorageObj.dateEdit.Day);
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



procedure TfrmRQStorageFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorage: RQStorageControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQStorageFilterObj.name := edtName.Text; 



     RQStorageFilterObj.shortName := edtShortName.Text; 



     RQStorageFilterObj.description := edtDescription.Text; 



     RQStorageFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQStorageFilterObj.dateEdit = nil then
          RQStorageFilterObj.dateEdit := TXSDateTime.Create;
       RQStorageFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQStorageFilterObj.dateEdit := nil;




  end;
end;




end.