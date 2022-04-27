
unit EditENSITFeatureHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSITFeatureHistoryController ;

type
  TfrmENSITFeatureHistoryFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblNewvalue : TLabel;
    edtNewvalue: TEdit;
    lblOldvalue : TLabel;
    edtOldvalue: TEdit;
    lblDategen : TLabel;
    edtDategen: TDateTimePicker;


  HTTPRIOENSITFeatureHistory: THTTPRIO;

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
  frmENSITFeatureHistoryFilterEdit: TfrmENSITFeatureHistoryFilterEdit;
  ENSITFeatureHistoryFilterObj: ENSITFeatureHistoryFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSITFeatureHistoryController  ;
}
{$R *.dfm}



procedure TfrmENSITFeatureHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtNewvalue
      ,edtOldvalue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSITFeatureHistoryObj.name; 



    edtNewvalue.Text := ENSITFeatureHistoryObj.newvalue; 



    edtOldvalue.Text := ENSITFeatureHistoryObj.oldvalue; 



      if ENSITFeatureHistoryObj.dategen <> nil then
      begin
        edtDategen.DateTime:=EncodeDate(ENSITFeatureHistoryObj.dategen.Year,ENSITFeatureHistoryObj.dategen.Month,ENSITFeatureHistoryObj.dategen.Day);
        edtDategen.checked := true;
      end
      else
      begin
        edtDategen.DateTime:=SysUtils.Date;
        edtDategen.checked := false;
      end;


  end;

}

end;



procedure TfrmENSITFeatureHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSITFeatureHistory: ENSITFeatureHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSITFeatureHistoryFilterObj.name := edtName.Text; 



     ENSITFeatureHistoryFilterObj.newvalue := edtNewvalue.Text; 



     ENSITFeatureHistoryFilterObj.oldvalue := edtOldvalue.Text; 



     if ENSITFeatureHistoryFilterObj.dategen = nil then
        ENSITFeatureHistoryFilterObj.dategen := TXSDate.Create;
      ENSITFeatureHistoryFilterObj.dategen.XSToNative(GetXSDate(edtdategen.DateTime));





  end;
end;




end.