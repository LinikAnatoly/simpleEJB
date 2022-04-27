
unit EditRQCentralExportGraphItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQCentralExportGraphItemController ;

type
  TfrmRQCentralExportGraphItemFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIORQCentralExportGraphItem: THTTPRIO;

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
  frmRQCentralExportGraphItemFilterEdit: TfrmRQCentralExportGraphItemFilterEdit;
  RQCentralExportGraphItemFilterObj: RQCentralExportGraphItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQCentralExportGraphItemController  ;
}
{$R *.dfm}



procedure TfrmRQCentralExportGraphItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if RQCentralExportGraphItemObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQCentralExportGraphItemObj.dateGen.Year,RQCentralExportGraphItemObj.dateGen.Month,RQCentralExportGraphItemObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;


  end;

}

end;



procedure TfrmRQCentralExportGraphItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQCentralExportGraphItem: RQCentralExportGraphItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateGen.checked then
     begin 
       if RQCentralExportGraphItemFilterObj.dateGen = nil then
          RQCentralExportGraphItemFilterObj.dateGen := TXSDate.Create;
       RQCentralExportGraphItemFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQCentralExportGraphItemFilterObj.dateGen := nil;




  end;
end;




end.