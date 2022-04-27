
unit EditENSzBrigadeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSzBrigadeController ;

type
  TfrmENSzBrigadeFilterEdit = class(TDialogForm)

    lblNazv : TLabel;
    edtNazv: TEdit;

    lblCeh_nazv : TLabel;
    edtCeh_nazv: TEdit;

    lblMain_podr_nazv : TLabel;
    edtMain_podr_nazv: TEdit;

    lblSizCode : TLabel;
    edtSizCode: TEdit;

    lblPodrId : TLabel;
    edtPodrId: TEdit;

    lblCehId : TLabel;
    edtCehId: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENSzBrigade: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblQuantity: TLabel;
    edtQuantity: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSzBrigadeFilterEdit: TfrmENSzBrigadeFilterEdit;
  ENSzBrigadeFilterObj: ENSzBrigadeFilter;

implementation

uses
  ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENSzBrigadeController  ;
}
{$R *.dfm}



procedure TfrmENSzBrigadeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtSizCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNazv.Text := ENSzBrigadeObj.nazv; 



    edtCeh_nazv.Text := ENSzBrigadeObj.ceh_nazv; 



    edtMain_podr_nazv.Text := ENSzBrigadeObj.main_podr_nazv; 



    if ( ENSzBrigadeObj.sizCode <> Low(Integer) ) then
       edtSizCode.Text := IntToStr(ENSzBrigadeObj.sizCode)
    else
       edtSizCode.Text := '';



    if ( ENSzBrigadeObj.podrId <> Low(Integer) ) then
       edtPodrId.Text := IntToStr(ENSzBrigadeObj.podrId)
    else
       edtPodrId.Text := '';



    if ( ENSzBrigadeObj.cehId <> Low(Integer) ) then
       edtCehId.Text := IntToStr(ENSzBrigadeObj.cehId)
    else
       edtCehId.Text := '';


  end;

}

end;



procedure TfrmENSzBrigadeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSzBrigade: ENSzBrigadeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSzBrigadeFilterObj.nazv := edtNazv.Text; 



     ENSzBrigadeFilterObj.ceh_nazv := edtCeh_nazv.Text; 



     ENSzBrigadeFilterObj.main_podr_nazv := edtMain_podr_nazv.Text; 



     if ( edtSizCode.Text <> '' ) then
       ENSzBrigadeFilterObj.sizCode := StrToInt(edtSizCode.Text)
     else
       ENSzBrigadeFilterObj.sizCode := Low(Integer) ;




     if ( edtPodrId.Text <> '' ) then
       ENSzBrigadeFilterObj.podrId := StrToInt(edtPodrId.Text)
     else
       ENSzBrigadeFilterObj.podrId := Low(Integer) ;




     if ( edtCehId.Text <> '' ) then
       ENSzBrigadeFilterObj.cehId := StrToInt(edtCehId.Text)
     else
       ENSzBrigadeFilterObj.cehId := Low(Integer) ;


     if ( edtQuantity.Text <> '' ) then
       ENSzBrigadeFilterObj.quantity := StrToInt(edtQuantity.Text)
     else
       ENSzBrigadeFilterObj.quantity := Low(Integer) ;



  end;
end;

procedure TfrmENSzBrigadeFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSzBrigadeFilterObj.element = nil then ENSzBrigadeFilterObj.element := ENElement.Create();
               ENSzBrigadeFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
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