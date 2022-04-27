
unit EditENCabelOut10Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelOut10Controller ;

type
  TfrmENCabelOut10FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCabelLength : TLabel;
    edtCabelLength: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENCabelOut10: THTTPRIO;

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
  frmENCabelOut10FilterEdit: TfrmENCabelOut10FilterEdit;
  ENCabelOut10FilterObj: ENCabelOut10Filter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENCabelOut10Controller  ;
}
{$R *.dfm}



procedure TfrmENCabelOut10FilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENCabelOut10Obj.name; 



    if ( ENCabelOut10Obj.cabelLength <> nil ) then
       edtCabelLength.Text := ENCabelOut10Obj.cabelLength.decimalString
    else
       edtCabelLength.Text := ''; 


  end;

}

end;



procedure TfrmENCabelOut10FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENCabelOut10: ENCabelOut10ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCabelOut10FilterObj.name := edtName.Text; 



     if (ENCabelOut10FilterObj.cabelLength = nil ) then
       ENCabelOut10FilterObj.cabelLength := TXSDecimal.Create;
     if edtCabelLength.Text <> '' then
       ENCabelOut10FilterObj.cabelLength.decimalString := edtCabelLength.Text 
     else
       ENCabelOut10FilterObj.cabelLength := nil;





  end;
end;

procedure TfrmENCabelOut10FilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCabelOut10FilterObj.element = nil then ENCabelOut10FilterObj.element := ENElement.Create();
               ENCabelOut10FilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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