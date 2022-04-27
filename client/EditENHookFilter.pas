
unit EditENHookFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHookController ;

type
  TfrmENHookFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENHookTypeHookTypeName : TLabel;
  edtENHookTypeHookTypeName : TEdit;
  spbENHookTypeHookType : TSpeedButton;
  

  HTTPRIOENHook: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENHookTypeHookTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENHookFilterEdit: TfrmENHookFilterEdit;
  ENHookFilterObj: ENHookFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENHookType
  ,ENHookTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENHookController  ;
}
{$R *.dfm}



procedure TfrmENHookFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENHookObj.name; 


  end;

}

end;



procedure TfrmENHookFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENHook: ENHookControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENHookFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENHookFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHookFilterObj.element = nil then ENHookFilterObj.element := ENElement.Create();
               ENHookFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENHookFilterEdit.spbENHookTypeHookTypeClick(Sender : TObject);
var 
   frmENHookTypeShow: TfrmENHookTypeShow;
begin
   frmENHookTypeShow:=TfrmENHookTypeShow.Create(Application,fmNormal);
   try
      with frmENHookTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHookFilterObj.hookType = nil then ENHookFilterObj.hookType := ENHookType.Create();
               ENHookFilterObj.hookType.code := StrToInt(GetReturnValue(sgENHookType,0));
               edtENHookTypeHookTypeName.Text:=GetReturnValue(sgENHookType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHookTypeShow.Free;
   end;
end;





end.