
unit EditRQSpravDKPPItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQSpravDKPPItemController ;

type
  TfrmRQSpravDKPPItemFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblName : TLabel;
    edtName: TMemo;



  HTTPRIORQSpravDKPPItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbSpravdkppitem: TSpeedButton;
    EdtSpravDKPP: TEdit;
    Label1: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbSpravdkppitemClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQSpravDKPPItemFilterEdit: TfrmRQSpravDKPPItemFilterEdit;
  RQSpravDKPPItemFilterObj: RQSpravDKPPItemFilter;

implementation

uses ShowRQSpravDKPP, RQSpravDKPPController;


{uses  
    EnergyproController, EnergyproController2, RQSpravDKPPItemController  ;
}
{$R *.dfm}



procedure TfrmRQSpravDKPPItemFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([ EdtSpravDKPP]);
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberGen.Text := RQSpravDKPPItemObj.numberGen; 



    MakeMultiline(edtName.Lines, RQSpravDKPPItemObj.name);


  end;

}

end;



procedure TfrmRQSpravDKPPItemFilterEdit.spbSpravdkppitemClick(Sender: TObject);
var
   frmrqspravdkppShow : TfrmRQSpravDKPPShow;
begin


   frmrqspravdkppShow := TfrmRQSpravDKPPShow.Create(Application, fmNormal);
   try
     with frmrqspravdkppShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           if RQSpravDKPPItemFilterObj.spravDKPPRef = nil then
           RQSpravDKPPItemFilterObj.spravDKPPRef := RQSpravDKPPRef.Create;
           RQSpravDKPPItemFilterObj.spravDKPPRef.code := StrToInt( GetReturnValue(sgRQSpravDKPP, 0)) ;
           EdtSpravDKPP.Text := GetReturnValue(sgRQSpravDKPP, 1) ;
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmrqspravdkppShow.Free;
   end;
end;

procedure TfrmRQSpravDKPPItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQSpravDKPPItem: RQSpravDKPPItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQSpravDKPPItemFilterObj.numberGen := edtNumberGen.Text;



     RQSpravDKPPItemFilterObj.name := edtName.Text; 




  end;
end;




end.