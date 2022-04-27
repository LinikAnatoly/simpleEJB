
unit EditENSheets4SOItemsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSheets4SOController ;

type
  TfrmENSheets4SOItemsFilterEdit = class(TDialogForm)

    lblContentValue : TLabel;
    edtContentValue: TMemo;

    lblAdditionalContent : TLabel;
    edtAdditionalContent: TMemo;



  HTTPRIOENSheets4SOItems: THTTPRIO;

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
  frmENSheets4SOItemsFilterEdit: TfrmENSheets4SOItemsFilterEdit;
  ENSheets4SOItemsFilterObj: ENSheets4SOItemsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSheets4SOItemsController  ;
}
{$R *.dfm}



procedure TfrmENSheets4SOItemsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtContentValue
      ,edtAdditionalContent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtContentValue.Lines, ENSheets4SOItemsObj.contentValue);



    MakeMultiline(edtAdditionalContent.Lines, ENSheets4SOItemsObj.additionalContent);


  end;

}

end;



procedure TfrmENSheets4SOItemsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSheets4SOItemsFilterObj.contentValue := edtContentValue.Text; 



     ENSheets4SOItemsFilterObj.additionalContent := edtAdditionalContent.Text; 




  end;
end;




end.