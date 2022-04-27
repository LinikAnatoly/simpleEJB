
unit EditRQStorageZoneFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorageZoneController ;

type
  TfrmRQStorageZoneFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblDescription : TLabel;
    edtDescription: TMemo;

  lblRQStorageStorageName : TLabel;
  edtRQStorageStorageName : TEdit;
  spbRQStorageStorage : TSpeedButton;
  

  HTTPRIORQStorageZone: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQStorageStorageClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQStorageZoneFilterEdit: TfrmRQStorageZoneFilterEdit;
  RQStorageZoneFilterObj: RQStorageZoneFilter;

implementation

uses
  ShowRQStorage
  ,RQStorageController
;

{uses  
    EnergyproController, EnergyproController2, RQStorageZoneController  ;
}
{$R *.dfm}



procedure TfrmRQStorageZoneFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtRQStorageStorageName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := RQStorageZoneObj.name; 



    MakeMultiline(edtDescription.Lines, RQStorageZoneObj.description);



    edtUserGen.Text := RQStorageZoneObj.userGen; 



      if RQStorageZoneObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorageZoneObj.dateEdit.Year,RQStorageZoneObj.dateEdit.Month,RQStorageZoneObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmRQStorageZoneFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorageZone: RQStorageZoneControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     RQStorageZoneFilterObj.name := edtName.Text;
     RQStorageZoneFilterObj.description := edtDescription.Text;
  end;
end;

procedure TfrmRQStorageZoneFilterEdit.spbRQStorageStorageClick(Sender : TObject);
var 
   frmRQStorageShow: TfrmRQStorageShow;
begin
   frmRQStorageShow:=TfrmRQStorageShow.Create(Application,fmNormal);
   try
      with frmRQStorageShow do
        if ShowModal = mrOk then
        begin
            try
               if RQStorageZoneFilterObj.storage = nil then RQStorageZoneFilterObj.storage := RQStorage.Create();
               RQStorageZoneFilterObj.storage.code := StrToInt(GetReturnValue(sgRQStorage,0));
               edtRQStorageStorageName.Text:=GetReturnValue(sgRQStorage,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQStorageShow.Free;
   end;
end;





end.