
unit EditENCheckpointPassListFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCheckpointPassListController ;

type
  TfrmENCheckpointPassListFilterEdit = class(TDialogForm)

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOENCheckpointPassList: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtENCheckpoint: TEdit;
    lblENCheckpoint: TLabel;
    spbENCheckpoint: TSpeedButton;
    spbTKTransportRealTransportReal: TSpeedButton;
    edtTKTransportRealTransportRealName: TEdit;
    lblTKTransportRealTransportRealName: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENCheckpointClick(Sender: TObject);
    procedure spbTKTransportRealTransportRealClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  

  private
    { Private declarations }
      transportRealCode : Integer;
  public
    { Public declarations }

end;

var
  frmENCheckpointPassListFilterEdit: TfrmENCheckpointPassListFilterEdit;
  ENCheckpointPassListFilterObj: ENCheckpointPassListFilter;


implementation


uses
  ENCheckpointController
  , ShowENCheckpoint, TKTransportRealController, ShowTKTransportReal;

{$R *.dfm}



procedure TfrmENCheckpointPassListFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
   transportRealCode := 0;
end;

procedure TfrmENCheckpointPassListFilterEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtENCheckpoint]);

end;



procedure TfrmENCheckpointPassListFilterEdit.spbENCheckpointClick(
  Sender: TObject);
var
  frmCheckpointShow : TfrmENCheckpointShow;
begin
  inherited;
  frmCheckpointShow := TfrmENCheckpointShow.Create(Application,fmNormal);
  try
    with frmCheckpointShow do
    begin
      DisableActions([actInsert, actEdit, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          if ENCheckpointPassListFilterObj.checkpointRef = nil then ENCheckpointPassListFilterObj.checkpointRef := ENCheckPointRef.Create;
          ENCheckpointPassListFilterObj.checkpointRef.code := StrToInt(GetReturnValue(sgENCheckpoint,0));
          edtENCheckpoint.Text := GetReturnValue(sgENCheckpoint,1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmCheckpointShow.Free;
  end;
end;

procedure TfrmENCheckpointPassListFilterEdit.spbTKTransportRealTransportRealClick(
  Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   str : string;
   TempTKTransportReal: TKTransportRealControllerSoapPort;
   trReal : TKTransportReal;
   isLastClosed : Boolean;
begin

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
      begin
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin
            try
                transportRealcode := StrToInt(GetReturnValue(sgTKTransportReal,0));
                edtTKTransportRealTransportRealName.Text := GetReturnValue(sgTKTransportReal,4) + ' ' + GetReturnValue(sgTKTransportReal,3);

                if (Length(ENCheckpointPassListFilterObj.conditionSQL) > 0) then
                    ENCheckpointPassListFilterObj.conditionSQL := ENCheckpointPassListFilterObj.conditionSQL + ' and encheckpointpasslist.code in (' +
                                                                  ' select ttm.checkpointpasslistrfcd from encheckpointpasslisttm ttm ' +
                                                                  ' where ttm.transportrealrefcode = ' + IntToStr(transportRealcode)  + ')'
                    else
                    ENCheckpointPassListFilterObj.conditionSQL := ' encheckpointpasslist.code in (' +
                                                                  ' select ttm.checkpointpasslistrfcd from encheckpointpasslisttm ttm ' +
                                                                  ' where ttm.transportrealrefcode = ' + IntToStr(transportRealcode) + ')';

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

procedure TfrmENCheckpointPassListFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCheckpointPassList: ENCheckpointPassListControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateStart.checked then
     begin
          if(Length(ENCheckpointPassListFilterObj.conditionSQL) > 0) then
          ENCheckpointPassListFilterObj.conditionSQL := ENCheckpointPassListFilterObj.conditionSQL + ' and to_date(to_char(encheckpointpasslist.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') >= to_date(''' + DateToStr(edtdateStart.Date) + ''', ''dd.mm.yyyy'')'
          else
          ENCheckpointPassListFilterObj.conditionSQL := ' to_date(to_char(encheckpointpasslist.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') >= to_date(''' + DateToStr(edtdateStart.Date) + ''', ''dd.mm.yyyy'')'
     end
     else
       ENCheckpointPassListFilterObj.dateStart := nil;

     if edtdateFinal.checked then
     begin
          if(Length(ENCheckpointPassListFilterObj.conditionSQL) > 0) then
            ENCheckpointPassListFilterObj.conditionSQL := ENCheckpointPassListFilterObj.conditionSQL + ' and to_date(to_char(encheckpointpasslist.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') <= to_date(''' + DateToStr(edtdateFinal.Date) + ''', ''dd.mm.yyyy'')'
          else
            ENCheckpointPassListFilterObj.conditionSQL := ' to_date(to_char(encheckpointpasslist.datestart,''dd.mm.yyyy''),''dd.mm.yyyy'') <= to_date(''' + DateToStr(edtdateFinal.Date) + ''', ''dd.mm.yyyy'')';
     end
     else
       ENCheckpointPassListFilterObj.dateFinal := nil;

  end;
end;




end.