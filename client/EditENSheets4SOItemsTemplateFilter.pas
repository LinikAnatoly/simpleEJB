
unit EditENSheets4SOItemsTemplateFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSheets4SOItemsTemplateController ;

type
  TfrmENSheets4SOItemsTemplateFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TMemo;

    lblTemplateValue : TLabel;
    edtTemplateValue: TMemo;



  HTTPRIOENSheets4SOItemsTemplate: THTTPRIO;

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
  frmENSheets4SOItemsTemplateFilterEdit: TfrmENSheets4SOItemsTemplateFilterEdit;
  ENSheets4SOItemsTemplateFilterObj: ENSheets4SOItemsTemplateFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSheets4SOItemsTemplateController  ;
}
{$R *.dfm}



procedure TfrmENSheets4SOItemsTemplateFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtTemplateValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtName.Lines, ENSheets4SOItemsTemplateObj.name);



    MakeMultiline(edtTemplateValue.Lines, ENSheets4SOItemsTemplateObj.templateValue);


  end;

}

end;



procedure TfrmENSheets4SOItemsTemplateFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSheets4SOItemsTemplateFilterObj.name := edtName.Text; 



     ENSheets4SOItemsTemplateFilterObj.templateValue := edtTemplateValue.Text; 




  end;
end;




end.