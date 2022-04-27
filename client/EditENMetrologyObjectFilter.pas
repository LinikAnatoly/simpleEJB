
unit EditENMetrologyObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMetrologyObjectController ;

type
  TfrmENMetrologyObjectFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;

  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENMetrologyObject: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMetrologyObjectFilterEdit: TfrmENMetrologyObjectFilterEdit;
  ENMetrologyObjectFilterObj: ENMetrologyObjectFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENMetrologyObjectController  ;
}
{$R *.dfm}



procedure TfrmENMetrologyObjectFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENMetrologyObjectObj.name; 



    edtCommentGen.Text := ENMetrologyObjectObj.commentGen; 


  end;

}

end;



procedure TfrmENMetrologyObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMetrologyObjectFilterObj.name := edtName.Text; 



     ENMetrologyObjectFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;

procedure TfrmENMetrologyObjectFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMetrologyObjectFilterObj.element = nil then ENMetrologyObjectFilterObj.element := ENElement.Create();
               ENMetrologyObjectFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.