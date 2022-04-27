
unit EditENTraversFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTraversController ;

type
  TfrmENTraversFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  
  lblENTraversTypeTraversTypeName : TLabel;
  edtENTraversTypeTraversTypeName : TEdit;
  spbENTraversTypeTraversType : TSpeedButton;
  

  HTTPRIOENTravers: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);
  procedure spbENTraversTypeTraversTypeClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTraversFilterEdit: TfrmENTraversFilterEdit;
  ENTraversFilterObj: ENTraversFilter;

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENTraversType
  ,ENTraversTypeController
;

{uses  
    EnergyproController, EnergyproController2, ENTraversController  ;
}
{$R *.dfm}



procedure TfrmENTraversFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENTraversObj.name; 


  end;

}

end;



procedure TfrmENTraversFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENTravers: ENTraversControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     ENTraversFilterObj.name := edtName.Text; 




  end;
end;

procedure TfrmENTraversFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTraversFilterObj.element = nil then ENTraversFilterObj.element := ENElement.Create();
               ENTraversFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;


procedure TfrmENTraversFilterEdit.spbENTraversTypeTraversTypeClick(Sender : TObject);
var 
   frmENTraversTypeShow: TfrmENTraversTypeShow;
begin
   frmENTraversTypeShow:=TfrmENTraversTypeShow.Create(Application,fmNormal);
   try
      with frmENTraversTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTraversFilterObj.traversType = nil then ENTraversFilterObj.traversType := ENTraversType.Create();
               ENTraversFilterObj.traversType.code := StrToInt(GetReturnValue(sgENTraversType,0));
               edtENTraversTypeTraversTypeName.Text:=GetReturnValue(sgENTraversType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTraversTypeShow.Free;
   end;
end;





end.